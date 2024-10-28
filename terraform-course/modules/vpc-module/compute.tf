locals {
  config_path_ec2 = file("${path.module}/test.json")
  config_file_ec2 = jsondecode(file("${path.module}/test.json"))   # read the configuration from the json file
  ami = data.aws_ami.ubuntu.id   # default to ubuntu ami
#   availability_zone = "us-east-1"
#   instance_type = "t2.micro"
  availability_zone = var.availability_zone != null ? var.availability_zone : lookup(local.config_file_ec2, "availability_zone", "us-east-1")
  instance_type = var.instance_type != null ? var.instance_type : lookup(local.config_file_ec2, "instance_type", "t2.micro")        # instead of using the var.instance_type using local.config_file_ec2
}


data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["amazon"]
  # filter {
  #   name = "name"
  #   values = [ "ubuntu-minimal/images-testing/hvm-ssd/ubuntu-jammy-daily-amd64-minimal-20241017" ]
  # }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  # filter {
  #   name = "ena-enabled"
  #   values = [ "Yes" ]
  # }
}



module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"
  ami = local.ami
  associate_public_ip_address = true
  availability_zone = local.availability_zone
  create = true
  create_eip = false
  instance_type = local.instance_type
  name = "${local.project}-instance" 
  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [ module.vpc.default_security_group_id ]
  tags = local.tags

}