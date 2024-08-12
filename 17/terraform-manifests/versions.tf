# Terraform configuration block
terraform {
  required_version = ">=1.6"
  required_providers {
    aws = {                     // terraform block does not accept the variables it should contain hardcoded values
      source  = "hashicorp/aws" // source from which it downloads the aws plugin
      version = ">=5.0"         //  which version of aws plugin terraform is going to use
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.0"

    }
  }

}

# Provider block
provider "aws" {
  profile = "default"
  region  = var.aws_region
}
