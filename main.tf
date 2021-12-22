data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

locals {
  enabled = module.this.enabled

  security_group_enabled = local.enabled && var.create_security_group
  s3_bucket_enabled      = local.enabled && var.create_s3_bucket
  iam_role_enabled       = local.enabled && var.create_iam_role
  account_id             = data.aws_caller_identity.current.account_id
  region                 = data.aws_region.current.name
}

data "aws_iam_policy_document" "iam_policy_document" {
  statement {
    sid       = ""
    actions   = ["airflow:PublishMetrics"]
    effect    = "Allow"
    resources = ["arn:aws:airflow:${local.region}:${local.account_id}:environment/${module.this.id}"]
  }

  statement {
    sid     = ""
    actions = ["s3:ListAllMyBuckets"]
    effect  = "Allow"
    resources = [
      var.create_s3_bucket ? module.mwaa_s3_bucket.bucket_arn : var.source_bucket_arn,
      "${var.create_s3_bucket ? module.mwaa_s3_bucket.bucket_arn : var.source_bucket_arn}/*"
    ]
  }

  statement {
    sid = ""
    actions = [
      "s3:GetObject*",
      "s3:GetBucket*",
      "s3:List*"
    ]
    effect = "Allow"
    resources = [
      var.create_s3_bucket ? module.mwaa_s3_bucket.bucket_arn : var.source_bucket_arn,
      "${var.create_s3_bucket ? module.mwaa_s3_bucket.bucket_arn : var.source_bucket_arn}/*"
    ]
  }

  statement {
    sid       = ""
    actions   = ["logs:DescribeLogGroups"]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = ""
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:GetLogRecord",
      "logs:GetLogGroupFields",
      "logs:GetQueryResults",
      "logs:DescribeLogGroups"
    ]
    effect    = "Allow"
    resources = ["arn:aws:logs:${local.region}:${local.account_id}:log-group:airflow-${module.this.id}*"]
  }

  statement {
    sid       = ""
    actions   = ["cloudwatch:PutMetricData"]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = ""
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ReceiveMessage",
      "sqs:SendMessage"
    ]
    effect    = "Allow"
    resources = ["arn:aws:sqs:${local.region}:*:airflow-celery-*"]
  }

  statement {
    sid = ""
    actions = [
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:GenerateDataKey*",
      "kms:Encrypt"
    ]
    effect        = "Allow"
    not_resources = ["arn:aws:kms:*:${local.account_id}:key/*"]
    condition {
      test     = "StringLike"
      variable = "kms:ViaService"
      values = [
        "sqs.${local.region}.amazonaws.com"
      ]
    }
  }
}

module "mwaa_security_group" {
  source  = "cloudposse/security-group/aws"
  version = "0.4.2"

  enabled                    = local.security_group_enabled
  security_group_description = var.security_group_description
  allow_all_egress           = true
  rules                      = var.additional_security_group_rules
  rule_matrix = [
    {
      source_security_group_ids = var.associated_security_group_ids
      rules = [
        {
          key         = "mwaa"
          type        = "ingress"
          from_port   = 0
          to_port     = 0
          protocol    = -1
          self        = true
          description = "Allow ingress Amazon MWAA traffic"
        }
      ]
    }
  ]
  vpc_id = var.vpc_id

  context = module.this.context
}

module "mwaa_s3_bucket" {
  source  = "cloudposse/s3-bucket/aws"
  version = "0.44.1"

  enabled = local.s3_bucket_enabled
  name    = module.this.id

  context = module.this.context
}

# module "mwaa_iam_policy" {
#   source  = "cloudposse/iam-policy/aws"
#   version = "0.2.3"

#   enabled = local.iam_role_enabled

#   iam_source_json       = var.iam_source_json
#   iam_source_json_url   = var.iam_source_json_url
#   iam_policy_statements = var.iam_policy_statements

#   context = module.this.context
# }

module "mwaa_iam_role" {
  source  = "cloudposse/iam-role/aws"
  version = "0.14.0"

  enabled = local.iam_role_enabled
  principals = {
    "Service" = [
      "airflow-env.amazonaws.com",
      "airflow.amazonaws.com"
    ]
  }

  use_fullname = true

  policy_documents = [
    data.aws_iam_policy_document.iam_policy_document.json,
  ]

  policy_document_count = 1
  policy_description    = "AWS MWAA IAM policy"
  role_description      = "AWS MWAA IAM role"

  context = module.this.context
}

resource "aws_mwaa_environment" "default" {
  count = local.enabled ? 1 : 0

  name                            = module.this.id
  airflow_configuration_options   = var.airflow_configuration_options
  airflow_version                 = var.airflow_version
  dag_s3_path                     = var.dag_s3_path
  environment_class               = var.environment_class
  kms_key                         = var.kms_key
  max_workers                     = var.max_workers
  min_workers                     = var.min_workers
  plugins_s3_object_version       = var.plugins_s3_object_version
  plugins_s3_path                 = var.plugins_s3_path
  requirements_s3_object_version  = var.requirements_s3_object_version
  requirements_s3_path            = var.requirements_s3_path
  webserver_access_mode           = var.webserver_access_mode
  weekly_maintenance_window_start = var.weekly_maintenance_window_start
  source_bucket_arn               = var.create_s3_bucket ? module.mwaa_s3_bucket.bucket_arn : var.source_bucket_arn
  execution_role_arn              = var.create_iam_role ? module.mwaa_iam_role.arn : var.execution_role_arn

  logging_configuration {
    dag_processing_logs {
      enabled   = var.dag_processing_logs_enabled
      log_level = var.dag_processing_logs_level
    }

    scheduler_logs {
      enabled   = var.scheduler_logs_enabled
      log_level = var.scheduler_logs_level
    }

    task_logs {
      enabled   = var.task_logs_enabled
      log_level = var.task_logs_level
    }

    webserver_logs {
      enabled   = var.webserver_logs_enabled
      log_level = var.webserver_logs_level
    }

    worker_logs {
      enabled   = var.worker_logs_enabled
      log_level = var.worker_logs_level
    }
  }

  network_configuration {
    security_group_ids = var.create_security_group ? concat(var.associated_security_group_ids, [module.mwaa_security_group.id]) : var.associated_security_group_ids
    subnet_ids         = var.subnet_ids
  }

  tags = module.this.tags
}
