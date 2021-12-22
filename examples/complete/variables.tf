variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for VPC creation"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "webserver_access_mode" {
  type        = string
  description = "Specifies whether the webserver should be accessible over the internet or via your specified VPC. Possible options: PRIVATE_ONLY (default) and PUBLIC_ONLY."
}

variable "airflow_configuration_options" {
  description = "The airflow_configuration_options parameter specifies airflow override options."
  type        = any
}

variable "airflow_version" {
  type        = string
  description = "Airflow version of the MWAA environment, will be set by default to the latest version that MWAA supports."
}

variable "dag_s3_path" {
  type        = string
  description = "The relative path to the DAG folder on your Amazon S3 storage bucket."
}

variable "environment_class" {
  type        = string
  description = "Environment class for the cluster. Possible options are mw1.small, mw1.medium, mw1.large."
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
