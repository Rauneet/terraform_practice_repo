module "ec2_public" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = "5.6.1"
  name                        = "${var.environment}-Bastion-ec2"
  ami                         = data.aws_ami.amazonlinux2.id
  instance_type               = var.instance_type
  monitoring                  = false
  key_name                    = var.key_name
  associate_public_ip_address = true // Whether to associate a public IP address with an instance in a VPC
  vpc_security_group_ids      = [module.public_bastion_sg.security_group_id]
  subnet_id                   = module.vpc.public_subnets[0]
  user_data                   = file("${path.module}/jumpbox-install.sh") # Added the jumpbox-install.sh to automatically install MySQL client
  tags                        = local.common_tags
}