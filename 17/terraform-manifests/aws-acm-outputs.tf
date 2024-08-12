#Outputs for AWS ACM
output "acm_arn" {
  description = "ARN of the certificate"
  value       = module.acm.acm_certificate_arn

}

output "validation_domains" {
  description = "List of distinct domain validation options. This is useful if subject alternative names contain wildcards"
  value       = module.acm.validation_domains
}

output "acm_certificate_status" {
  description = "Status of the certificate"
  value       = module.acm.acm_certificate_status
}

# output "type" {
#   description = "Type of the certificate"
#   value       = aws_acm_certificate.cert.type

# }

