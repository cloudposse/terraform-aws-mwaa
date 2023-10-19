module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.1.0"

  ipv4_primary_cidr_block = "172.16.0.0/16"

  context = module.this.context
}

module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.4.1"

  availability_zones   = var.availability_zones
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.vpc.igw_id
  ipv4_cidr_block      = module.vpc.vpc_cidr_block
  nat_gateway_enabled  = true
  nat_instance_enabled = false

  context = module.this.context
}

module "mwaa" {
  source = "../.."

  region                        = var.region
  vpc_id                        = module.vpc.vpc_id
  subnet_ids                    = module.subnets.private_subnet_ids
  airflow_version               = var.airflow_version
  dag_s3_path                   = var.dag_s3_path
  environment_class             = var.environment_class
  min_workers                   = var.min_workers
  max_workers                   = var.max_workers
  webserver_access_mode         = var.webserver_access_mode
  dag_processing_logs_enabled   = var.dag_processing_logs_enabled
  dag_processing_logs_level     = var.dag_processing_logs_level
  scheduler_logs_enabled        = var.scheduler_logs_enabled
  scheduler_logs_level          = var.scheduler_logs_level
  task_logs_enabled             = var.task_logs_enabled
  task_logs_level               = var.task_logs_level
  webserver_logs_enabled        = var.webserver_logs_enabled
  webserver_logs_level          = var.webserver_logs_level
  worker_logs_enabled           = var.worker_logs_enabled
  worker_logs_level             = var.worker_logs_level
  airflow_configuration_options = var.airflow_configuration_options

  context = module.this.context
}
