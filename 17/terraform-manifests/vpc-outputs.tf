output "azs" {
  description = "A list of az specified as argument"
  value       = module.vpc.azs
}

output "database_subnet_group" {
  description = "Database subnet group"
  value       = module.vpc.database_subnet_group
}

output "database_subnet_group_name" {
  description = "Database subnet group name"
  value       = module.vpc.database_subnet_group_name

}

output "database_subnets" {
  description = "Database subnets"
  value       = module.vpc.database_subnets

}

output "database_subnets_cidr_blocks" {
  description = "List of cidr_blocks of database subnets"
  value       = module.vpc.database_subnets_cidr_blocks

}

output "igw_arn" {
  description = "The ARN of the Internet Gateway"
  value       = module.vpc.igw_arn

}

output "igw_id" {
  description = "IGW id"
  value       = module.vpc.igw_id

}

output "vpc_arn" {
  description = "VPC ARN"
  value       = module.vpc.vpc_arn

}

output "vpc_name" {
  description = "VPC name"
  value       = module.vpc.name

}

output "nat_ids" {
  description = " List of allocation ID of Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_ids

}

output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = module.vpc.nat_public_ips

}

output "private_route_table_association_ids" {
  description = "List of IDs of the private route table association"
  value       = module.vpc.private_route_table_association_ids

}

output "private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.vpc.private_route_table_ids

}

output "private_subnet_arns" {
  description = "Private subnet ARN"
  value       = module.vpc.private_subnet_arns

}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets

}

output "private_subnets_cidr_blocks" {
  description = " List of cidr_blocks of private subnets"
  value       = module.vpc.private_subnets_cidr_blocks

}


