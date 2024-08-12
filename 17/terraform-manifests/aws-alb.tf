module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "9.10.0"

  vpc_id                     = module.vpc.vpc_id
  subnets                    = module.vpc.public_subnets
  enable_deletion_protection = false
  security_groups            = [module.public_loadbalancer_security_group.security_group_id]
  listeners = {
    # Listener-1: my-http-https-redirect
    my-http-https-redirect = {
      port     = 80
      protocol = "HTTP"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    } # End my-http-https-redirect Listener
    # Listener-2: my-https-listener
    my-https-listener = {
      port            = 443
      protocol        = "HTTPS"
      ssl_policy      = "ELBSecurityPolicy-TLS13-1-2-Res-2021-06"
      certificate_arn = module.acm.acm_certificate_arn
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed response : Root Context"
        status_code  = "200"
      } # End of Fixed Response 
      # Loadbalancer Rules
      rules = {
        # Rule-1: myapp1-rule
        myapp1-rule = {
          priority = 1
          actions = [{
            type = "weighted-forward"
            target_groups = [
              {
                target_group_key = "mytg1"
                weight           = 1

              }
            ]
            stickiness = {
              enabled  = true
              duration = 3600
            }

          }]
          conditions = [{
            path_pattern = ["app1/*"]
          }]
        } # End of app1 Rule
        # Rule-2: myapp2-rule
        myapp2-rule = {
          priority = 2
          actions = [{
            type = "weighted-forward"
            target_groups = [
              {
                target_group_key = "mytg2"
                weight           = 1
              }
            ]
            stickiness = {
              enabled  = true
              duration = 3600
            }


          }]
          conditions = [{
            path_pattern = ["app2/*"]
          }]
        } #End of rule 2 :mytg2

        myapp3-rule = {
          priority = 3
          actions = [{
            type = "weighted-forward"
            target_groups = [{
              target_group_key = "mytg3"
              weight           = 1
            }]
            stickiness = {
              enabled  = true
              duration = 3600
            }
          }]
          conditions = [{
            path_pattern = {
              values = ["/*"]
            }
          }]
        } # End of myapp-rule 3
      }   #End of rules  
    }     # End of listener 2 

  } #End of listeners

  # Target Groups
  target_groups = {
    mytg1 = {
      name_prefix                       = "mytg1-"
      create_attachment                 = false
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_algorithm_type     = "weighted_random"
      load_balancing_anomaly_mitigation = "on"
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      } # End of health check
      tags = local.common_tags
    } # End of mytg1 target group

    # Start of the second target group
    mytg2 = {
      name_prefix                       = "mytg2-"
      create_attachment                 = false
      protocol                          = "HTTP"
      port                              = 80
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_algorithm_type     = "weighted_random"
      load_balancing_anomaly_mitigation = "on"
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app2/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      } # End of health check
      tags = local.common_tags

    } # End of second target group ; mytg2

    mytg3 = {
      name_prefix                       = "mytg3-"
      create_attachment                 = false
      protocol                          = "HTTP"
      port                              = 8080
      target_type                       = "instance"
      deregistration_delay              = 10
      load_balancing_algorithm_type     = "weighted_random"
      load_balancing_anomaly_mitigation = "on"
      load_balancing_cross_zone_enabled = false
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/login"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      } # End of health check
      tags = local.common_tags

    }
  } #End of target groups
  tags = local.common_tags
}

# mytg1: LB Target Group Attachment
resource "aws_lb_target_group_attachment" "mytg1" {
  for_each         = { for k, v in module.ec2_private_app1 : k => v }
  target_group_arn = module.alb.target_groups["mytg1"].arn
  target_id        = each.value.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "mytg2" {
  for_each         = { for k, v in module.ec2_private_app2 : k => v }
  target_group_arn = module.alb.target_groups["mytg2"].arn
  target_id        = each.value.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "mytg3" {
  for_each         = { for k, v in module.ec2_private_app3 : k => v }
  target_group_arn = module.alb.target_groups["mytg3"].arn
  target_id        = each.value.id
  port             = 80
}