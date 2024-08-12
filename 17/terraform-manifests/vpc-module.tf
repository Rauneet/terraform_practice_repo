module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.9.0"
  # VPC Basic Details
  name                 = "${local.name}-${var.vpc_name}"
  azs                  = var.azs
  cidr                 = var.vpc_cidr_block
  public_subnets       = var.public_subnets
  public_subnet_names  = var.public_subnet_names
  private_subnets      = var.private_subnets
  private_subnet_names = var.private_subnet_names
  // Database Subnets
  database_subnets                   = var.database_subnets
  database_subnet_names              = var.database_subnet_names
  create_database_subnet_group       = var.create_database_subnet_group
  create_database_subnet_route_table = var.create_database_subnet_route_table
  database_subnet_group_name         = var.database_subnet_group_name
  # VPC DNS Parameters
  enable_dns_hostnames = var.enable_dns_hostnames // Should be true to enable DNS hostnames in the VPC
  enable_dns_support   = var.enable_dns_support   // Should be true to enable DNS support in the VPC
  # NAT Gateways - Outbound Communication
  enable_nat_gateway = var.enable_nat_gateway //  Should be true if you want to provision NAT Gateways for each of your private networks
  single_nat_gateway = var.single_nat_gateway // Should be true if you want to provision a single shared NAT Gateway across all of your private networks
  # IGW
  create_igw                          = var.create_igw                          // Controls if an Internet Gateway is created for public subnets and the related routes that connect them
  create_multiple_public_route_tables = var.create_multiple_public_route_tables // Indicates whether to create a separate route table for each public subnet. Default: `false`
  # Tags
  database_subnet_tags = { // Additional tags for the database subnets
    Type = "database-subnet"
  }
  igw_tags = { // Additional tags for the internet gateway
    Type = "internet-gateway"
  }
  public_subnet_tags = {
    Type = "public-subnets"

  }
  private_subnet_tags = {
    Type = "private-subnets"

  }
  vpc_tags = {
    Name = "vpc-dev"
  }
  tags = local.common_tags
}