output "public_subnet_1_id" {
    value = aws_subnet.public-subnet-1.id
    description = "id of public-subnet-1"
  
}

output "public_subnet_2_id" {
    value = aws_subnet.public-subnet-1.id
    description = "id of public-subnet-2"
  
}

output "private_subnet_1_id" {
    value = aws_subnet.private-subnet-1.id
    description = "id of private-subnet-1"
  
}

output "private_subnet_2_id" {
    value = aws_subnet.private-subnet-2.id
    description = "id of private-subnet-2"
  
}

output "private_subnet_3_id" {
    value = aws_subnet.private-subnet-3.id
    description = "id of private-subnet-3"
  
}

output "private_subnet_4_id" {
    value = aws_subnet.private-subnet-4.id
    description = "id of private-subnet-4"
  
}

output "cidr_public_subnet_1" {
    description = "cidr of public subnet 1"
    value = aws_subnet.public-subnet-1.cidr_block
  
}

output "cidr_public_subnet_2" {
    description = "cidr of public subnet 2"
    value = aws_subnet.public-subnet-2.cidr_block
  
}


output "cidr_private_subnet_1" {
    description = "cidr of private subnet 1"
    value = aws_subnet.private-subnet-1.cidr_block
  
}

output "cidr_private_subnet_2" {
    description = "cidr of private subnet 2"
    value = aws_subnet.private-subnet-2.cidr_block
  
}

output "cidr_private_subnet_3" {
    description = "cidr of private subnet 3"
    value = aws_subnet.private-subnet-3.cidr_block
  
}

output "cidr_private_subnet_4" {
    description = "cidr of private subnet 4"
    value = aws_subnet.private-subnet-4.cidr_block
  
}

output "main_route_table_id" {
    description = "main route table id"
    value = aws_route_table.main_rt.id
  
}

output "public_route_table_id" {
    description = "main route table id"
    value = aws_route_table.public_rt.id
  
}

output "igw_id" {
    description = "igw id"
    value = aws_internet_gateway.igw.id
  
}