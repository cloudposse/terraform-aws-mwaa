data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

locals {
  enabled = module.this.enabled

  security_group_enabled = local.enabled && var.create_security_group
  s3_bucket_enabled      = local.enabled && var.create_s3_bucket
  iam_role_enabled       = local.enabled && var.create_iam_role
  account_id             = data.aws_caller_identity.current.account_id
  partition              = data.aws_partition.current.partition
  security_group_ids     = var.create_security_group ? concat(var.associated_security_group_ids, [module.mwaa_security_group.id]) : var.associated_security_group_ids
  s3_bucket_arn          = var.create_s3_bucket ? module.mwaa_s3_bucket.bucket_arn : var.source_bucket_arn
  execution_role_arn     = var.create_iam_role ? module.mwaa_iam_role.arn : var.execution_role_arn
}

module "s3_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  enabled    = local.s3_bucket_enabled
  attributes = ["s3"]

  context = module.this.context
}

module "sg_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  enabled    = local.security_group_enabled
  attributes = ["sg"]

  context = module.this.context
}

module "iam_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  enabled    = local.iam_role_enabled
  attributes = ["iam"]

  context = module.this.context
}

data "aws_iam_policy_document" "this" {
  statement {
    actions   = ["airflow:PublishMetrics"]
    effect    = "Allow"
    resources = ["arn:${local.partition}:airflow:${var.region}:${local.account_id}:environment/${module.this.id}"]
  }

  statement {
    actions = ["s3:ListAllMyBuckets"]
    effect  = "Deny"
    resources = [
      local.s3_bucket_arn,
      "${local.s3_bucket_arn}/*"
    ]
  }

  statement {
    actions = [
      "s3:GetObject*",
      "s3:GetBucket*",
      "s3:List*"
    ]
    effect = "Allow"
    resources = [
      local.s3_bucket_arn,
      "${local.s3_bucket_arn}/*"
    ]
  }

  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:CreateLogGroup",
      "logs:PutLogEvents",
      "logs:GetLogEvents",
      "logs:GetLogRecord",
      "logs:GetLogGroupFields",
      "logs:GetQueryResults"
    ]
    effect    = "Allow"
    resources = ["arn:${local.partition}:logs:${var.region}:${local.account_id}:log-group:airflow-${module.this.id}-*"]
  }

  statement {
    actions   = ["logs:DescribeLogGroups"]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    actions   = ["s3:GetAccountPublicAccessBlock"]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    actions   = ["cloudwatch:PutMetricData"]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    actions = [
      "sqs:ChangeMessageVisibility",
      "sqs:DeleteMessage",
      "sqs:GetQueueAttributes",
      "sqs:GetQueueUrl",
      "sqs:ReceiveMessage",
      "sqs:SendMessage"
    ]
    effect    = "Allow"
    resources = ["arn:${local.partition}:sqs:${var.region}:*:airflow-celery-*"]
  }

  statement {
    actions = [
      "kms:Decrypt",
      "kms:DescribeKey",
      "kms:GenerateDataKey*",
      "kms:Encrypt"
    ]
    effect        = "Allow"
    not_resources = ["arn:${local.partition}:kms:*:${local.account_id}:key/*"]
    condition {
      test     = "StringLike"
      variable = "kms:ViaService"
      values = [
        "sqs.${var.region}.amazonaws.com",
        "s3.${var.region}.amazonaws.com"
      ]
    }
  }
}

module "mwaa_security_group" {
  source  = "cloudposse/security-group/aws"
  version = "1.0.1"

  enabled                       = local.security_group_enabled
  security_group_name           = var.security_group_name
  create_before_destroy         = var.security_group_create_before_destroy
  security_group_create_timeout = var.security_group_create_timeout
  security_group_delete_timeout = var.security_group_delete_timeout

  security_group_description = var.security_group_description
  allow_all_egress           = var.allow_all_egress
  rules                      = var.additional_security_group_rules
  rule_matrix = [
    {
      source_security_group_ids = var.allowed_security_group_ids
      cidr_blocks               = var.allowed_cidr_blocks
      self                      = true
      rules = [
        {
          key         = "mwaa"
          type        = "ingress"
          from_port   = 0
          to_port     = 0
          protocol    = -1
          self        = true
          description = "Allow ingress Amazon MWAA traffic"
        },
      ]
    }
  ]
  vpc_id = var.vpc_id

  context = module.sg_label.context
}

module "mwaa_s3_bucket" {
  source  = "cloudposse/s3-bucket/aws"
  version = "4.0.0"

  enabled = local.s3_bucket_enabled

  context = module.s3_label.context
}

module "mwaa_iam_role" {
  source  = "cloudposse/iam-role/aws"
  version = "0.16.2"

  enabled = local.iam_role_enabled
  principals = {
    "Service" = [
      "airflow-env.amazonaws.com",
      "airflow.amazonaws.com"
    ]
  }

  use_fullname = true

  policy_documents = [
    data.aws_iam_policy_document.this.json,
  ]

  policy_document_count = 1
  policy_description    = "AWS MWAA IAM policy"
  role_description      = "AWS MWAA IAM role"

  context = module.iam_label.context
}

resource "aws_mwaa_environment" "default" {
  count = local.enabled ? 1 : 0

  name                             = module.this.id
  airflow_configuration_options    = var.airflow_configuration_options
  airflow_version                  = var.airflow_version
  dag_s3_path                      = var.dag_s3_path
  environment_class                = var.environment_class
  kms_key                          = var.kms_key
  max_workers                      = var.max_workers
  min_workers                      = var.min_workers
  plugins_s3_object_version        = var.plugins_s3_object_version
  plugins_s3_path                  = var.plugins_s3_path
  requirements_s3_object_version   = var.requirements_s3_object_version
  requirements_s3_path             = var.requirements_s3_path
  startup_script_s3_object_version = var.startup_script_s3_object_version
  startup_script_s3_path           = var.startup_script_s3_path
  webserver_access_mode            = var.webserver_access_mode
  weekly_maintenance_window_start  = var.weekly_maintenance_window_start
  source_bucket_arn                = local.s3_bucket_arn
  execution_role_arn               = local.execution_role_arn

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
    security_group_ids = local.security_group_ids
    subnet_ids         = var.subnet_ids
  }

  tags = module.this.tags
}
