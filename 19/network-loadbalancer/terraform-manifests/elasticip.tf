# Resource to create elastic ip and associate the bastion ec2
resource "aws_eip" "bastion_elastic_ip" {
  instance   = module.ec2_public.id
  domain     = "vpc"
  depends_on = [module.vpc, module.ec2_public]
  tags       = local.common_tags

  # local exec provisioner : executes when the resource is destroyed - Triggered during deletion of Resource

  provisioner "local-exec" {
    command     = "echo destroy time prov `date` >> destroyed.txt"
    working_dir = "local-exec-output-files/"
    when        = destroy

  }

}

