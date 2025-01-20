terraform {
  required_providers {
    aws = {
      version = "~> 3.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region  = "ap-south-1"
  profile = "default"
}

# provider meta-arguments

provider "aws" {
    region = "us-east-1"
    profile = "default"
    alias = "ohio"
  
}
