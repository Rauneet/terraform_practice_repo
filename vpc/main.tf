# Create VPC

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = var.instance_tenancy_value
    tags = {
      Name = "myvpc"
    }
  
}

# Create public subnets 

resource "aws_subnet" "public-subnet-1" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = var.availability_zone_value_1

  tags = {
    Name = "public-subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id     = aws_vpc.myvpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.availability_zone_value_2

  tags = {
    Name = "public-subnet-2"
  }
}

# Create private subnet 

resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = var.availability_zone_value_1
    tags = {
        Tier = "App"
        Name = "private-subnet-1"
    }
  
}


resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = var.availability_zone_value_2
    tags = {
        Tier = "App"
        Name = "private-subnet-2"
    }
  
}

resource "aws_subnet" "private-subnet-3" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = var.availability_zone_value_1
    tags = {
        Tier = "Database"
        Name = "private-subnet-3"
    }
  
}

resource "aws_subnet" "private-subnet-4" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.5.0/24"
    availability_zone = var.availability_zone_value_2
    tags = {
        Tier = "Database"
        Name = "private-subnet-4"
    }
  
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "igw"
  }
}

# Create Public Route Table

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.myvpc.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "public_rt"

  }
}

# Create Main Route table 

resource "aws_route_table" "main_rt" {
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "main_rt"
    }
}

# Associate public subnets with the public route table 

resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public_rt.id
}

# Associate private subnets with the main route table 

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.main_rt.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.main_rt.id
}

resource "aws_route_table_association" "private_subnet_3_association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.main_rt.id
}

resource "aws_route_table_association" "private_subnet_4_association" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.main_rt.id
}

