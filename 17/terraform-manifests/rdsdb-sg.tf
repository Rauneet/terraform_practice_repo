# Security Group for RDS DB

module "rdsdb" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "5.1.2"
  name        = "${var.environment}-rdsdb-sg"
  description = "Access to MySQL DB for the entire VPC cidr block"
  vpc_id      = module.vpc.vpc_id
  ingress_with_cidr_blocks = [ // List of ingress rules to create where 'cidr_blocks' is used
    {
      from_port   = 3306
      to_port     = 3306
      description = "MySQL access from within VPC"
      protocol    = "tcp"
      cidr_blocks = module.vpc.vpc_cidr_block

    },
  ]
  # Egress Rule - all-all open
  egress_rules = ["all-all"]

  tags = local.common_tags

}