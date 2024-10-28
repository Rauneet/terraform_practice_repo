locals {
  config_path_net = file("${path.module}/test.json")
  config_file_net = jsondecode(file("${path.module}/test.json"))
  project     = "vpc-project"
  name = var.name != null ? var.name : lookup(local.config_file_net, "name", "prod-vpc")

#   name        = "prod-vpc"
  cidr        = var.cidr != null ? var.cidr : lookup(local.config_file_net, "cidr_block", "10.0.0.0/16")
  azs         = data.aws_availability_zone.azs_avail.name
  public_subnets = length(var.public_subnets) > 0 ? var.public_subnets : lookup(local.config_file_net, "public_subnets", [])
  private_subnets = length(var.private_subnets) > 0 ? var.private_subnets : lookup(local.config_file_net, "private_subnets", [])
  # Use the user-provided AZ or fallback to "us-east-1a" if not provided
  user_entered_az = length(var.azs) > 0 ? var.azs : tolist([lookup(local.config_file_net, "azs", ["us-east-1a"])[0]])
  # Merge user-provided tags and project-specific tags
  tags = merge(
    {
      project = local.project
    }, 
    lookup(local.config_file_net, "tags", {})
  ) # Merge additional tags from JSON file
}

# Declare the data source
data "aws_availability_zone" "azs_avail" {
  # all_availability_zones = true
  state = "available"
  name  = local.user_entered_az[0] # Use the user-entered availability zone
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }


}


module "vpc" {
  source          = "terraform-aws-modules/vpc/aws"
  version         = "5.14.0"
  name            = local.name
  cidr            = local.cidr
  public_subnets = local.public_subnets
  private_subnets = local.private_subnets
#   public_subnets  = ["10.0.1.0/24"]
#   private_subnets = ["10.0.2.0/24"]
  azs             = local.user_entered_az
  tags            = local.tags
  #   azs             = [data.aws_availability_zone.azs_avail.name]
  #   tags            = merge(local.tags)
}

