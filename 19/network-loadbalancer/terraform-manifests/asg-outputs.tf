output "asg_id" {
  description = "Auto Scaling Group id"
  value       = aws_autoscaling_group.myasg.id

}

output "asg_arn" {
  description = "ARN for this Auto Scaling Group"
  value       = aws_autoscaling_group.myasg.arn

}

output "asg_az" {
  description = "Availability zones of the Auto Scaling Group"
  value       = aws_autoscaling_group.myasg.availability_zones

}

output "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  value       = aws_autoscaling_group.myasg.min_size

}


output "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  value       = aws_autoscaling_group.myasg.max_size

}

output "asg_name" {
  description = "Name of the Auto Scaling Group"
  value       = aws_autoscaling_group.myasg.name

}

output "health_check_type" {
  description = "Type of the health check"
  value       = aws_autoscaling_group.myasg.health_check_type

}

output "health_check_grace_period" {
  description = "Type of the health check"
  value       = aws_autoscaling_group.myasg.health_check_grace_period

}

output "vpc_zone_identifier" {
  description = "Type of the health check"
  value       = aws_autoscaling_group.myasg.vpc_zone_identifier

}