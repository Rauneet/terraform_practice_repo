# Output public EC2 : Bastion EC2 

output "ec2_public_ip" {
  description = "The public IP address assigned to the instance"
  value       = module.ec2_public.public_ip

}

output "ec2_public_public_dns" {
  description = "The public DNS name assigned to the instance"
  value       = module.ec2_public.public_dns

}

output "ec2_public_instance_state" {
  description = "The state of the instance"
  value       = module.ec2_public.instance_state

}

output "ec2_public_id" {
  description = "The ID of the instance"
  value       = module.ec2_public.id

}

output "ec2_public_ebs_block_device" {
  description = "EBS block device information"
  value       = module.ec2_public.ebs_block_device
}

output "ec2_public_ami" {
  description = "AMI ID that was used to create the instance"
  value       = module.ec2_public.ami

}

output "ec2_public_arn" {
  description = "The ARN of the instance"
  value       = module.ec2_public.arn

}

# Output private EC2 : Private EC2 : APP1

output "ec2_private_ids_app1" {
  description = "The ID of the instance"
  value       = [for ec2private in module.ec2_private_app1 : ec2private.id]

}


output "ec2_private_ip_app1" {
  description = "List of private IP addresses assigned to the instances"
  value       = [for ec2private in module.ec2_private_app1 : ec2private.private_ip]

}


# Output private EC2 : Private EC2 : APP2

output "ec2_private_ids_app2" {
  description = "The ID of the instance"
  value       = [for ec2private in module.ec2_private_app2 : ec2private.id]

}


output "ec2_private_ip_app2" {
  description = "List of private IP addresses assigned to the instances"
  value       = [for ec2private in module.ec2_private_app2 : ec2private.private_ip]

}

# Output private EC2 : Private EC2 : APP3
output "ec2_private_ids_app3" {
  description = "The ID of the instance"
  value       = [for ec2private in module.ec2_private_app3 : ec2private.id]

}


output "ec2_private_ip_app3" {
  description = "List of private IP addresses assigned to the instances"
  value       = [for ec2private in module.ec2_private_app3 : ec2private.private_ip]

}