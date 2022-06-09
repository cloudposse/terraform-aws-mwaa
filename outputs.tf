output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = local.s3_bucket_arn
}

output "execution_role_arn" {
  description = "IAM Role ARN for Amazon MWAA Execution Role"
  value       = local.execution_role_arn
}

output "arn" {
  description = "The ARN of the Amazon MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.arn)
}

output "created_at" {
  description = "The Created At date of the Amazon MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.created_at)
}

output "logging_configuration" {
  description = "The Logging Configuration of the Amazon MWAA Environment"
  value       = try(aws_mwaa_environment.default[0].logging_configuration, [])
}

output "service_role_arn" {
  description = "The Service Role ARN of the Amazon MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.service_role_arn)
}

output "status" {
  description = "The status of the Amazon MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.status)
}

output "tags_all" {
  description = "A map of tags assigned to the resource, including those inherited from the provider for the Amazon MWAA Environment"
  value       = try(aws_mwaa_environment.default[0].tags_all, [])
}

output "webserver_url" {
  description = "The webserver URL of the Amazon MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.webserver_url)
}

output "security_group_id" {
  value       = join("", compact(module.mwaa_security_group.*.id))
  description = "The ID of the created security group"
}

output "security_group_arn" {
  value       = join("", compact(module.mwaa_security_group.*.arn))
  description = "The ARN of the created security group"
}

output "security_group_name" {
  value       = join("", compact(module.mwaa_security_group.*.name))
  description = "The name of the created security group"
}
