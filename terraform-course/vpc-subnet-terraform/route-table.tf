# Public Route table
resource "aws_route_table" "public_rtb" {
    vpc_id = aws_vpc.terraform_course_vpc.id
    depends_on = [ aws_internet_gateway.igw ]
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "${local.common_tags.Name}-public-rtb"
        Environment = "${local.common_tags.Environment}"
    }
  
}
#Public Subnet association
resource "aws_route_table_association" "public_rtb_assoc" {
    subnet_id      = aws_subnet.public_subnet_1a.id
    route_table_id = aws_route_table.public_rtb.id

  
}
#Private route table
resource "aws_route_table" "private_rtb" {
    vpc_id = aws_vpc.terraform_course_vpc.id
    // no route will be defined since this is the private route table 
    tags = {
        Name = "${local.common_tags.Name}-private-rtb"
        Environment = "${local.common_tags.Environment}"
    } 
}

#private subnet association
resource "aws_route_table_association" "private_rtb_assoc" {
    subnet_id = aws_subnet.private_subnet_1a.id
    route_table_id = aws_route_table.private_rtb.id
}