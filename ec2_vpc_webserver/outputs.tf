output "vpc_id" {
    value = aws_vpc.vpc.id
    description = "vpc id"
  
}

output "subnet_id" {
    description = "subnet id"
    value = aws_subnet.public-subnet.id
  
}

output "security_group_name_id" {
    description = "security group id"
    value = aws_security_group.allow-web-traffic.id
  
}

output "key_pair_name" {
  value = aws_key_pair.deployer.key_name
}

