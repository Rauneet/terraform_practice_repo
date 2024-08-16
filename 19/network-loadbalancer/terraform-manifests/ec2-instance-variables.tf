variable "instance_type" {
  description = "Instance type for the ec2 instance resource"
  type        = string
  default     = "t3.micro"

}


# variable "instance_name" {
#     description = "Name of the instance"
#     type = string
#     default = "bastion-ec2-instance"

# }

variable "key_name" {
  description = "EC2 instance key name"
  type        = string
  default     = "terraform-managed-key-pair"

}

variable "instance_count" {
  description = "No. of instances to be created"
  type        = number
  default     = 1

}