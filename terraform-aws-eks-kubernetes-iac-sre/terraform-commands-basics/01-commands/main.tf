resource "aws_instance" "ec2-instance" {
/* if you want to provision the resource other than the defualt 
region then you can use the provider meta-argument in the resource block
*/  
  provider = aws.ohio   // in this case the resource will be provisioned in us-east-1 region
  instance_type = "t3.micro"
  ami           = "ami-0c55b159cbfafe1f0"
  tags = {
    Name        = "ec2-instance"
    Environment = "dev"
  }
  root_block_device {
    volume_size = 10
    volume_type = "gp2"

  }


}



resource "aws_instance" "for_each_with_map_ec2-instance" {
  /* if you want to provision the resource other than the defualt 
region then you can use the provider meta-argument in the resource block
*/
  provider      = aws.ohio // in this case the resource will be provisioned in us-east-1 region
  for_each      = var.instance_type   // it takes the map or set as an input and creates the resource for each key
  instance_type = each.value          // it takes the value of the key from the map or set and creates the resource
  #   instance_type = var.instance_type_map["dev"]
  ami = "ami-0c55b159cbfafe1f0"
  tags = {
    Name        = "ec2-instance"
    Environment = "dev"
  }
  root_block_device {
    volume_size = 10
    volume_type = "gp2"

  }


}