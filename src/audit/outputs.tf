output "region" {
  value       = data.aws_region.current.name
  description = "Region name for this account"
}

output "account_id" {
  value       = data.aws_caller_identity.current.account_id
  description = "Account Id for this account"
}

output "central_flow_log_bucket_arn" {
  value       = aws_s3_bucket.flow_logs_bucket.arn
  description = "ARN of central flow log bucket"
}
