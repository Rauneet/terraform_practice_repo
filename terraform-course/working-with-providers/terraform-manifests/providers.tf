terraform {
  backend "s3" {
    bucket = "terraform-remotestate-bucket-2024"
    key = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
  required_providers {
    random = {
        source = "hashicorp/random"
        version = "~>3.0"
    }
    aws = {
        source = "hashicorp/aws"
        version = "~>5.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"
    profile = "default"
}

provider "aws" {
    region = "us-east-1"
    profile = "default"
    alias = "useast"
  
}

# This s3 bucket will be created in the us-east-1 region
resource "aws_s3_bucket" "eu_west_1" {
  bucket = "some-random-bucket-name-aosdhfoadhfu"
  provider = aws.useast
}