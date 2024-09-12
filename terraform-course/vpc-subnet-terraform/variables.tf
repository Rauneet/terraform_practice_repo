variable "region" {
    type = string
    default = "ap-south-1"
  
}

# VPC Variables
variable "cidr" {
    type = string
}

variable "instance_tenancy" {
    type = string
}

#Public Subnet Variables

variable "public_subnet_cidr" {
    type = string
}

variable "public_subnet_az_1a" {
    type = string
}

#Private subnet Variables
variable "private_subnet_cidr" {
    type = string
}

variable "private_subnet_az_1a" {
    type = string
}