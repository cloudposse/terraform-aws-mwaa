output "security_group_ids" {
  description = "IDs of the MWAA Security Group(s)"
  value       = var.create_security_group ? concat(var.associated_security_group_ids, [module.mwaa_security_group.id]) : var.associated_security_group_ids
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = var.create_s3_bucket ? module.mwaa_s3_bucket.bucket_arn : var.source_bucket_arn
}

output "execution_role_arn" {
  description = "IAM Role ARN for Amazon MWAA Execution Role"
  value       = var.create_iam_role ? module.mwaa_iam_role.arn : var.execution_role_arn
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
