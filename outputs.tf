output "security_group_ids" {
  description = "IDs of the MWAA Security Group(s)"
  value       = var.create_security_group ? concat(var.associated_security_group_ids, [module.mwaa_security_group.id]) : var.associated_security_group_ids
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  value       = var.create_s3_bucket ? module.mwaa_s3_bucket.bucket_arn : var.source_bucket_arn
}

output "execution_role_arn" {
  description = "IAM Role ARN for MWAA Execution Role"
  value       = var.create_iam_role ? module.mwaa_iam_role.arn : var.execution_role_arn
}

output "mwaa_environment_arn" {
  description = "The ARN of the MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.arn)
}

output "mwaa_environment_created_at" {
  description = "The Created At date of the MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.created_at)
}

output "mwaa_environment_logging_configuration" {
  description = "The Created At date of the MWAA Environment"
  value       = join("", try(aws_mwaa_environment.default.*.logging_configuration[0], null))
}

output "mwaa_environment_service_role_arn" {
  description = "The Created At date of the MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.service_role_arn)
}

output "mwaa_environment_status" {
  description = "The Created At date of the MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.status)
}

# output "mwaa_environment_tags_all" {
#   description = "The Created At date of the MWAA Environment"
#   value       = join("", aws_mwaa_environment.default.*.tags_all)
# }

output "mwaa_environment_webserver_url" {
  description = "The Created At date of the MWAA Environment"
  value       = join("", aws_mwaa_environment.default.*.webserver_url)
}
