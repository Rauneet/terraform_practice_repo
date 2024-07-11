resource "aws_instance" "backup_instance" {
    
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instance_type
    availability_zone = var.availability_zone
    key_name = aws_key_pair.backup_instance_key_pair.key_name
    monitoring = false
    
    root_block_device {
        delete_on_termination = true
        volume_type = "standard"
        volume_size = 10

    }
    tags = var.tags
  
}

resource "aws_key_pair" "backup_instance_key_pair" {
    key_name = "backup-key-pair"
    public_key = file("/Users/mac/Desktop/Terraform_practice/.ssh/public_key.pub")
  
}