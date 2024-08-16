resource "aws_sns_topic" "my_asg_topic" {
  name = "${local.name}-asg-topic"
}