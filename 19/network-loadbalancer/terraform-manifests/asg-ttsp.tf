###### Target Tracking Scaling Policies ######
# TTS - Scaling Policy-1: Based on CPU Utilization
# Define Autoscaling Policies and Associate them to Autoscaling Group
resource "aws_autoscaling_policy" "avg_cpu_policy_greater_than_xx" {
  name                      = "avg-cpu-policy-greater-than-xx"
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.myasg.id
  estimated_instance_warmup = 300 // defaults to ASG default cooldown 300 seconds if not set
  # CPU Utilization is above 50
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}

# TTS - Scaling Policy-1: Based on ALB requests
resource "aws_autoscaling_policy" "alb_target_requests_greater_than_yy" {
  name                      = "alb-target-requests-greater-than-yy"
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.myasg.id
  estimated_instance_warmup = 300 // defaults to ASG default cooldown 300 seconds if not set
  # CPU Utilization is above 50
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ALBTargetGroupRequestCount"
      resource_label         = "${module.nlb.arn_suffix}/${module.nlb.target_groups["mytg1"].arn_suffix}"
    }
    target_value = 10.0
  }


}

output "asg_build_resource_label" {
  value = "${module.nlb.arn_suffix}/${module.nlb.target_groups["mytg1"].arn_suffix}"
}