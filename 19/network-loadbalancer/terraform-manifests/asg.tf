# Module/Resource to create the ASG resource

# resource "aws_placement_group" "test" {
#   name     = "test"
#   strategy = "cluster"
# }

resource "aws_autoscaling_group" "myasg" {
  name                      = "${local.name}-myasg"
  max_size                  = 5
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  desired_capacity          = 2
  force_delete              = true
  #   placement_group           = aws_placement_group.test.id
  #   launch_configuration      = aws_launch_configuration.foobar.name
  vpc_zone_identifier = module.vpc.private_subnets

  instance_maintenance_policy {
    min_healthy_percentage = 90
    max_healthy_percentage = 120
  }
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = aws_launch_template.my_launch_template.latest_version
  }
  instance_refresh {
    strategy = "Rolling"
    preferences {
      checkpoint_delay             = 3600
      max_healthy_percentage       = 100
      min_healthy_percentage       = 90
      skip_matching                = false
      auto_rollback                = false    // (Optional) Automatically rollback if instance refresh fails. Defaults to false. This option may only be set to true when specifying a launch_template or mixed_instances_policy.
      scale_in_protected_instances = "Ignore" // Behavior when encountering instances protected from scale in are found. Available behaviors are Refresh, Ignore, and Wait. Default is Ignore.
      standby_instances            = "Ignore" // Behavior when encountering instances in the Standby state in are found. Available behaviors are Terminate, Ignore, and Wait. Default is Ignore. 
    }
    triggers = ["desired_capacity"]
  }

  #   initial_lifecycle_hook {
  #     name                 = "foobar"
  #     default_result       = "CONTINUE"
  #     heartbeat_timeout    = 2000
  #     lifecycle_transition = "autoscaling:EC2_INSTANCE_LAUNCHING"

  # notification_metadata = jsonencode({
  #   foo = "bar"
  # })

  #     notification_target_arn = "arn:aws:sqs:us-east-1:444455556666:queue1*"
  #     role_arn                = "arn:aws:iam::123456789012:role/S3Access"
  #   }

  tag {
    key                 = "Owner"
    value               = "Web-team"
    propagate_at_launch = true
  }

  timeouts {
    delete = "15m"
  }

  tag {
    key                 = "Owner"
    value               = "Infra-team"
    propagate_at_launch = false
  }
}