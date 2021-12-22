output "mwaa_environment_arn" {
  description = "The ARN of the MWAA Environment"
  value       = module.mwaa.mwaa_environment_arn
}

output "mwaa_environment_logging_configuration" {
  description = "The Created At date of the MWAA Environment"
  value       = module.mwaa.mwaa_environment_logging_configuration
}
