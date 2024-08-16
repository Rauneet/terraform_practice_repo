module "ec2_private_app1" {
  source        = "terraform-aws-modules/ec2-instance/aws"
  version       = "5.6.1"
  depends_on    = [module.vpc]
  name          = "${var.environment}-app1"
  ami           = data.aws_ami.amazonlinux2.id
  monitoring    = false
  instance_type = var.instance_type
  key_name      = var.key_name
  for_each      = toset(["0", "1"]) // For creating multiple instance in the private subnet
  subnet_id     = element(module.vpc.private_subnets, tonumber(each.key))

  #   subnet_id = module.vpc.private_subnets[0]


  #   subnet_id = module.vpc.private_subnets[0]

  user_data              = file("${path.module}/app1-install.sh")
  vpc_security_group_ids = [module.private_security_group.security_group_id]
  tags                   = local.common_tags

}
