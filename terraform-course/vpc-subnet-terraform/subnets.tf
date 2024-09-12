resource "aws_subnet" "public_subnet_1a" {
    vpc_id = aws_vpc.terraform_course_vpc.id
    availability_zone = var.public_subnet_az_1a   // 10.0.0.0/24
    cidr_block = var.public_subnet_cidr
    tags = {
        Name = "${local.common_tags.Name}-public-subnet-1a"
        Environment = "${local.common_tags.Environment}"
    }
}

resource "aws_subnet" "private_subnet_1a" {
    vpc_id = aws_vpc.terraform_course_vpc.id
    availability_zone = var.private_subnet_az_1a
    cidr_block = var.private_subnet_cidr
    tags = {
        Name = "${local.common_tags.Name}-private-subnet-1a"
        Environment = "${local.common_tags.Environment}"
    }
  
}