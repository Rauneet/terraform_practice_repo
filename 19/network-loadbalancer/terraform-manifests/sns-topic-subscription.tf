// Provides a resource for subscribing to SNS topics
resource "aws_sns_topic_subscription" "myasg_sns_topic_subscription" {
  protocol  = "email"
  topic_arn = aws_sns_topic.my_asg_topic.arn
  endpoint  = "vrauneet@gmail.com"

}