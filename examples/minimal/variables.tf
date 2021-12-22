variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for VPC creation"
}

variable "region" {
  type        = string
  description = "AWS region"
}
