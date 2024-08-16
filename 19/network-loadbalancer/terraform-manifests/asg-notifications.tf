// Resource/Module to create the SNS topic and subscription for the ASG
// Provides an AutoScaling Group with Notification support, via SNS Topics. Each of the notifications map to a Notification Configuration inside Amazon Web Services
resource "aws_autoscaling_notification" "my_asg_notification" {
  group_names = [
    aws_autoscaling_group.myasg.name
  ]
  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]
  topic_arn = aws_sns_topic.my_asg_topic.arn
}



