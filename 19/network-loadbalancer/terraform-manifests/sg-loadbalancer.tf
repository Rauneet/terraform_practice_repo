# Security Group for Public Loadbalancer
module "public_loadbalancer_security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = "5.1.2"
  name                = "${var.environment}-loadbalancer-sg"
  description         = "Security Group with HTTP open for entire Internet (IPv4 CIDR), egress ports are all world open"
  vpc_id              = module.vpc.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"] // for NLB
  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]
  tags         = local.common_tags
  ingress_with_cidr_blocks = [ // List of ingress rules to create where 'cidr_blocks' is used
    {
      from_port   = 81
      to_port     = 81
      description = "Allow Port 81 from internet"
      protocol    = 6
      cidr_blocks = "0.0.0.0/0"
    }
  ]

}

