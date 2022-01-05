variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones for VPC subnets"
}

variable "region" {
  type        = string
  description = "AWS region"
}
