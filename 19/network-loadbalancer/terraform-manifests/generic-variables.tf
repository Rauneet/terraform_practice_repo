# Variable for AWS Region
variable "aws_region" {
  description = "AWS region in which the resources will be created"
  type        = string
  default     = "ap-south-1"

}

variable "environment" {
  description = "Type of environment"
  type        = string
  default     = "Dev"

}

variable "business_devision" {
  description = "Businsess Division"
  type        = string
  default     = "DevOps"

}

