data "aws_ami" "ubuntu" {
    most_recent = true
    owners = ["amazon"]
 
}

data "aws_iam_policy" "backup_full_access" {
    arn = "arn:aws:iam::aws:policy/AWSBackupFullAccess"
  
}

data "aws_backup_vault" "backup_vault_name" {
  name = "${var.project_name}-backup-vault"
   depends_on = [
    aws_iam_role.backup_admin_role,
    aws_iam_role_policy_attachment.backup_policy_attachment,
    
  ]
}