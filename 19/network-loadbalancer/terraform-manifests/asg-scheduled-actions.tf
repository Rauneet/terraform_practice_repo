## Create Scheduled Actions
### Create Scheduled Action-1: Increase capacity during business hours
resource "aws_autoscaling_schedule" "my_asg_schedule1" {
  scheduled_action_name = "my-asg-schedule-business-hour"
  min_size              = 2
  max_size              = 4
  desired_capacity      = 2
  # for start time
  start_time             = "2024-08-15T04:30:00Z"
  recurrence             = "0 10 * * * "
  autoscaling_group_name = aws_autoscaling_group.myasg.name
}

## Create Scheduled Actions
### Create Scheduled Action-2: Decrease capacity during non business hours
resource "aws_autoscaling_schedule" "my_asg_schedule2" {
  scheduled_action_name = "my-asg-schedule-non-business-hour"
  min_size              = 1
  max_size              = 4
  desired_capacity      = 1
  # for start time
  start_time             = "2024-08-15T12:30:00Z"
  recurrence             = "0 18 * * *"
  autoscaling_group_name = aws_autoscaling_group.myasg.name
}

output "aws_autoscaling_schedule_arn_1" {
  description = "ARN assigned by AWS to the autoscaling schedule"
  value       = aws_autoscaling_schedule.my_asg_schedule1.arn

}

output "aws_autoscaling_schedule_arn_2" {
  description = "ARN assigned by AWS to the autoscaling schedule"
  value       = aws_autoscaling_schedule.my_asg_schedule2.arn

}