data "aws_route53_zone" "mydomain" {
  name = "rauneet.com"
  #   private_zone = true
}


# Output reference for route53 zone
output "route53_arn" {
  description = "ARN of the Hosted Zone."
  value       = data.aws_route53_zone.mydomain.arn

}

# Output MyDomain Zone ID
output "mydomain_zoneid" {
  description = "The Hosted Zone id of the desired Hosted Zone"
  value       = data.aws_route53_zone.mydomain.zone_id
}

output "hosted_name" {
  description = " The Hosted Zone name"
  value       = data.aws_route53_zone.mydomain.name

}