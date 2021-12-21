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

variable "dag_processing_logs_enabled" {
  type        = bool
  description = "Enabling or disabling the collection of logs for processing DAGs"
}

variable "dag_processing_logs_level" {
  type        = string
  description = "DAG processing logging level. Valid values: CRITICAL, ERROR, WARNING, INFO, DEBUG"
}
