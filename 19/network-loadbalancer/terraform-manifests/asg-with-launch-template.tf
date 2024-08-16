# Launch Template Resource
resource "aws_launch_template" "my_launch_template" {
  name                   = "${local.name}-launch-template"
  default_version        = "1.0"
  description            = "My Launch template"
  //update_default_version = true


  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      volume_size           = 20
      delete_on_termination = true
      volume_type           = "gp3"
    }
  }

  #   capacity_reservation_specification {
  #     capacity_reservation_preference = "open"
  #   }

  #   cpu_options {
  #     core_count       = 4
  #     threads_per_core = 2
  #   }

  #   credit_specification {
  #     cpu_credits = "standard"
  #   }

  #   disable_api_stop        = true
  #   disable_api_termination = true

  ebs_optimized = true

  #   elastic_gpu_specifications {
  #     type = "test"
  #   }

  #   elastic_inference_accelerator {
  #     type = "eia1.medium"
  #   }

  #   iam_instance_profile {
  #     name = "test"
  #   }

  image_id = data.aws_ami.amazonlinux2

  instance_initiated_shutdown_behavior = "terminate"

  #   instance_market_options {
  #     market_type = "spot"
  #   }

  instance_type = var.instance_type
  key_name      = var.key_name

  #   license_specification {
  #     license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  #   }

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
  }

  #   placement {
  #     availability_zone = "ap-south-1a"
  #   }

  #   ram_disk_id = "test"

  vpc_security_group_ids = [module.private_security_group.security_group_id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "myasg"
    }
  }

  user_data = filebase64("${path.module}/app1-install.sh")
}