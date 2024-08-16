output "sns_topic_arn" {
  description = "ARN of the sns topic"
  value       = aws_sns_topic.my_asg_topic.arn

}

# output "sns_group_names" {
#   description = "Group names of the asg"
#   value       = aws_sns_topic.my_asg_topic.group_names

# }

# output "sns_notifications" {
#   description = "Notifications of sns"
#   value       = aws_sns_topic.my_asg_topic.notifications

# }