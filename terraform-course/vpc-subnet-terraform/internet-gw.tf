resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.terraform_course_vpc.id
    tags = {
        Name = "${local.common_tags.Name}-igw"
        Environment = "${local.common_tags.Environment}"

    }
  
}