variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "dev-vpc"
}

variable "vpc_cidr_block" {
  description = "VPC cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availbility zones"
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
}

variable "public_subnets" {
  description = "List of public subnet cidr"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "public_subnet_names" {
  description = "List of public subnet names"
  type        = list(string)
  default     = ["public-subnet-1", "public-subnet-2"]
}

variable "private_subnets" {
  description = "List of private subnet cidr"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_names" {
  description = "List of private subnet names"
  type        = list(string)
  default     = ["private-subnet-1", "private-subnet-2"]
}


variable "database_subnet_names" {
  description = "List of database subnet names"
  type        = list(string)
  default     = ["database-subnet-1", "database-subnet-2"]
}

variable "database_subnets" {
  description = "List of database subnet cidr"
  type        = list(string)
  default     = ["10.0.151.0/24", "10.0.152.0/24"]
}

variable "create_database_subnet_group" {
  description = "Bool value to create the database subnet group"
  type        = bool
  default     = true

}

variable "create_database_subnet_route_table" {
  description = "Bool value to create the database subnet route table"
  type        = bool
  default     = true

}

variable "database_subnet_group_name" {
  description = "Name of the database subnet group"
  type        = string
  default     = "db-subnet-group"

}

variable "enable_dns_hostnames" {
  description = "enable DNS hostnames in the VPC"
  type        = bool
  default     = true

}

variable "enable_dns_support" {
  description = "enable DNS support in the VPC"
  type        = bool
  default     = true

}

variable "enable_nat_gateway" {
  description = "provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true

}

variable "single_nat_gateway" {
  description = "provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = true

}

variable "create_igw" {
  description = " Controls if an Internet Gateway is created for public subnets and the related routes that connect them"
  type        = bool
  default     = true

}

variable "create_multiple_public_route_tables" {
  description = "Indicates whether to create a separate route table for each public subnet. Default: `false`"
  type        = bool
  default     = false

}