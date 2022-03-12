variable "region" {
  type        = string
  description = "AWS region"
}

variable "create_s3_bucket" {
  type        = bool
  description = "Enabling or disabling the creatation of an S3 bucket for AWS MWAA"
  default     = true
}

variable "create_iam_role" {
  type        = bool
  description = "Enabling or disabling the creatation of a default IAM Role for AWS MWAA"
  default     = true
}

variable "source_bucket_arn" {
  type        = string
  description = "If `create_s3_bucket` is `false` then set this to the Amazon Resource Name (ARN) of your Amazon S3 storage bucket."
  default     = null
}

variable "execution_role_arn" {
  type        = string
  default     = ""
  description = "If `create_iam_role` is `false` then set this to the target MWAA execution role"
}

variable "airflow_configuration_options" {
  description = "The Airflow override options"
  type        = any
  default     = null
}

variable "airflow_version" {
  type        = string
  description = "Airflow version of the MWAA environment, will be set by default to the latest version that MWAA supports."
  default     = ""
}

variable "dag_s3_path" {
  type        = string
  description = "The relative path to the DAG folder on your Amazon S3 storage bucket."
  default     = "dags"
}

variable "environment_class" {
  type        = string
  description = "Environment class for the cluster. Possible options are mw1.small, mw1.medium, mw1.large."
  default     = "mw1.small"
}

variable "kms_key" {
  type        = string
  description = "The Amazon Resource Name (ARN) of your KMS key that you want to use for encryption. Will be set to the ARN of the managed KMS key aws/airflow by default."
  default     = null
}

variable "max_workers" {
  type        = number
  description = "The maximum number of workers that can be automatically scaled up. Value need to be between 1 and 25."
  default     = 10
}

variable "min_workers" {
  type        = number
  description = "The minimum number of workers that you want to run in your environment."
  default     = 1
}

variable "plugins_s3_object_version" {
  type        = string
  description = "The plugins.zip file version you want to use."
  default     = null
}

variable "plugins_s3_path" {
  type        = string
  description = "The relative path to the plugins.zip file on your Amazon S3 storage bucket. For example, plugins.zip. If a relative path is provided in the request, then plugins_s3_object_version is required"
  default     = null
}

variable "requirements_s3_object_version" {
  type        = string
  description = "The requirements.txt file version you"
  default     = null
}

variable "requirements_s3_path" {
  type        = string
  description = "The relative path to the requirements.txt file on your Amazon S3 storage bucket. For example, requirements.txt. If a relative path is provided in the request, then requirements_s3_object_version is required"
  default     = null
}

variable "webserver_access_mode" {
  type        = string
  description = "Specifies whether the webserver should be accessible over the internet or via your specified VPC. Possible options: PRIVATE_ONLY (default) and PUBLIC_ONLY."
  default     = "PRIVATE_ONLY"
}

variable "weekly_maintenance_window_start" {
  type        = string
  description = "Specifies the start date for the weekly maintenance window."
  default     = null
}

variable "dag_processing_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for processing DAGs"
  default     = false
}

variable "dag_processing_logs_level" {
  type        = string
  description = "DAG processing logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "scheduler_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for the schedulers"
  default     = false
}

variable "scheduler_logs_level" {
  type        = string
  description = "Schedulers logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "task_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for DAG tasks"
  default     = false
}

variable "task_logs_level" {
  type        = string
  description = "DAG tasks logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "webserver_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for the webservers"
  default     = false
}

variable "webserver_logs_level" {
  type        = string
  description = "Webserver logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "worker_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for the workers"
  default     = false
}

variable "worker_logs_level" {
  type        = string
  description = "Workers logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
  default     = "INFO"
}

variable "subnet_ids" {
  type        = list(string)
  description = "The private subnet IDs in which the environment should be created. MWAA requires two subnets"
}
