output "state_bucket_name" {
  description = "The name of the state bucket"
  value       = aws_s3_bucket.state_bucket.bucket
}

output "state_bucket_arn" {
  description = "The ARN of the state bucket"
  value       = aws_s3_bucket.state_bucket.arn
}

output "artifact_bucket_name" {
  description = "The name of the artifact bucket"
  value       = aws_s3_bucket.artifact_bucket.bucket
}

output "artifact_bucket_arn" {
  description = "The ARN of the artifact bucket"
  value       = aws_s3_bucket.artifact_bucket.arn
}

output "deployment_context_bucket_name" {
  description = "The name of the deployment context bucket"
  value       = aws_s3_bucket.deployment_context.bucket
}


output "deployment_context_bucket_arn" {
  description = "The ARN of the deployment context bucket"
  value       = aws_s3_bucket.deployment_context.arn
}

