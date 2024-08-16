module "nlb" {
  source                           = "terraform-aws-modules/alb/aws"
  version                          = "9.11.0"
  name                             = "${local.name}-my-nlb"
  load_balancer_type               = "network"
  vpc_id                           = module.vpc.vpc_id
  dns_record_client_routing_policy = "availability_zone_affinity"
  security_groups                  = [module.public_loadbalancer_security_group.security_group_id]
  subnets                          = module.vpc.public_subnets
  # Use `subnet_mapping` to attach EIPs
  #   subnet_mapping = [for i, eip in aws_eip.bastion_elastic_ip :
  #     {
  #       allocation_id = aws_eip.bastion_elastic_ip.allocation_id
  #       subnet_id     = module.vpc.private_subnets
  #     }
  #   ]
  # For example only
  enable_deletion_protection = false
  # Security Group
  enforce_security_group_inbound_rules_on_private_link_traffic = "off"
  #Listeners
  listeners = {
    my-tcp = {
      port     = 80
      protocol = "TCP"
      forward = {
        target_group_key = "mytg1"
      }
    } # End Listener-1: TCP Listener
    # Listener 2 : TLS
    my-tls = {
      port     = 443
      protocol = "TLS"
      certificate_arn = module.acm.acm_certificate_arn
      forward = {
        target_group_key = "mytg1"
      }


    } # End Listener-2: TLS Listener (SSL)
  }   # End Listeners Block








  # target group start
  target_groups = {
    // First target group
    mytg1 = {
      create_attachment      = false
      name_prefix            = "mytg1-"
      protocol               = "TCP"
      port                   = 80
      target_type            = "instance"
      deregistration_delay   = 10
      connection_termination = true
      preserve_client_ip     = true
      stickiness = {
        type = "source_ip"
      } # End of stickness
      tags = {
        tcp_udp1 = true
      } # End of tags for mytg1
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/app1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
      }
      # Second target group
      mytg2 = {
        create_attachment      = false
        name_prefix            = "mytg2-"
        protocol               = "TCP_UDP"
        port                   = 80
        target_type            = "instance"
        connection_termination = true
        preserve_client_ip     = true
        stickiness = {
          type = "source_ip"
        } # End of stickness
        tags = {
          tcp_udp2 = true
        } # End of tags
        health_check = {
          enabled             = true
          interval            = 30
          path                = "/app1/index.html"
          port                = "traffic-port"
          healthy_threshold   = 3
          unhealthy_threshold = 3
          timeout             = 6
        }
      } # End of mytg2
    }
  }
  tags = local.common_tags
}