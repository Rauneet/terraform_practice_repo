variable "region" {
    default = "ap-south-1"
  
}


variable "key_name" {
    type = string
    description = "key name value"
    default = "deployer-key"
  
}

variable "public_key_path" {
    description = "path to public key"
  
}

variable "instance_type" {
    description = "instance type"
    default = "t2.micro"
    type = string
  
}

variable "instance_tenancy" {
    default = "default"
    type = string
    description = "instance tenancy value"
  
}

variable "vpc_cidr" {
    description = "vpc cidr"
    default = "10.0.0.0/16"
  
}

variable "availability_zone" {
    description = "availability-zone"
  
}

variable "security_group_name" {
    default = "allow-web-traffic"
    type = string
    description = "name of the security group"
  
}

variable "protocol" {
    default = "tcp"
    type = string
    description = "protocol value"
  
}

variable "user_data" {
    description = "User data script"
    default = <<EOF
    "sudo apt update"
    "sudo apt install apache -y"
    "sudo systemctl enable apache"
    "sudo systemctl start apache"
EOF 
}