locals {
  common_tags = {
    Name        = "nginx-webserver"
    Environment = "Dev"
  }
}



resource "aws_vpc" "dev_nginx_vpc" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name        = "${local.common_tags.Name}-vpc"
    Environment = "${local.common_tags.Environment}"
  }
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = aws_vpc.dev_nginx_vpc.id
  availability_zone = var.availability_zone
  cidr_block        = var.public_subnet_cidr
  tags = {
    Name        = "${local.common_tags.Name}-public-subnet-1a"
    Environment = "${local.common_tags.Environment}"

  }

}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.dev_nginx_vpc.id
  tags = {
    Name        = "${local.common_tags.Name}-igw"
    Environment = "${local.common_tags.Environment}"
  }

}

resource "aws_route_table" "public_rtb" {
  vpc_id = aws_vpc.dev_nginx_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name        = "${local.common_tags.Name}-public-rtb"
    Environment = "${local.common_tags.Environment}"

  }

}


resource "aws_route_table_association" "public_rtb_assoc" {
  route_table_id = aws_route_table.public_rtb.id
  subnet_id      = aws_subnet.public_subnet_1a.id
  # gateway_id = aws_internet_gateway.igw.id
  # vpc_id = aws_vpc.nginx_vpc.id

}



# resource "aws_security_group" "nginx_sg" {
#   name        = "nginx-sg"
#   description = "allow traffic to port 80(http) and port 443(https)"
#   vpc_id      = aws_vpc.dev_nginx_vpc.id
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     description = "allow traffic from port 80(http) from anywhere"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     description = "allow traffic from port 443(https) from anywhere"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     description = "allow traffic going out from the instance"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

# }

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"] // amzn2-ami-hvm-*-gp2
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}


resource "aws_instance" "nginx_ec2_server" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.public_traffic.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.public_subnet_1a.id
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"
  }

  user_data = file("${path.module}/nginx-install.sh")
  tags = {
    Name        = "${local.common_tags.Name}-nginx-server"
    Environment = "${local.common_tags.Environment}"

  }
  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_security_group" "public_traffic" {
  name        = "public-traffic"
  description = "allow public traffic on port 80 and port 443"
  vpc_id      = aws_vpc.dev_nginx_vpc.id
  tags = merge(local.common_tags, {
    Name = "public-traffic-sg"
  })


}


resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_traffic.id
  # cidr_ipv4         = aws_vpc.dev_nginx_vpc.cidr_block
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 80
  to_port     = 80
  ip_protocol = "tcp"

}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_traffic.id
  # cidr_ipv4         = aws_vpc.dev_nginx_vpc.cidr_block
  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  to_port     = 443
  ip_protocol = "tcp"

}

