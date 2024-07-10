resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)

}

resource "aws_instance" "webserver" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = var.instance_type
    user_data = var.user_data
    network_interface {
      network_interface_id = aws_network_interface.network-interface.id
      device_index = 0
    }
    tags = {
      Name = "webserver"
    }
  
}


resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "vpc"
  }
}


resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw"
  }
}


resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_route_table" "route-table" {
    vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
      Name = "RT"
    }
  
}


resource "aws_route_table_association" "route-table-association" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.route-table.id
  
}


resource "aws_security_group" "allow-web-traffic" {
    name = var.security_group_name
    description = "allow web traffic"
    vpc_id = aws_vpc.vpc.id
    ingress {
        from_port = 443
        to_port = 443
        cidr_blocks = ["0.0.0.0/0"]
        protocol = var.protocol
        description = "allow traffic from anywhere"
    }
    ingress {
        from_port = 80
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
        protocol = var.protocol
        description = "allow traffic from anywhere"
    }

    ingress {
        from_port = 22
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
        protocol = var.protocol
        description = "allow ssh traffic from anywhere"
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

    tags = {
      Name = "allow-web-traffic"
    }
  
}

resource "aws_network_interface" "network-interface" {
    subnet_id = aws_subnet.public-subnet.id
    private_ips = ["10.0.1.50"]
    security_groups = [ aws_security_group.allow-web-traffic.id ]
  
}



# Data block for the AMI
data "aws_ami" "amazon_linux" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name   = "name"
      values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }

  
}