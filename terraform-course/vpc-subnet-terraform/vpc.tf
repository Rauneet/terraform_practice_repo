locals {
  common_tags = {
    Name = "terraform-course"
    Environment = "Dev"
  }
}


# VPC
resource "aws_vpc" "terraform_course_vpc" {
    cidr_block = var.cidr
    instance_tenancy = var.instance_tenancy
    tags = {
        Name = "${local.common_tags.Name}-vpc"
        Environment = "${local.common_tags.Environment}"
    }
}