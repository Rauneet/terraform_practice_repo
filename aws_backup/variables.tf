variable "project_name" {
    description = "Name of the project"
    type = string 
}

variable "region" {
    description = "Region in which you want to create the backup resource"
    type = string 
}

variable "instance_type" {
    description = "Type of instance which you want to create"
    type = string
  
}

variable "tags" {
    description = "tags for the resources"
    type = map(string)
}

variable "availability_zone" {
    type = string
    description = "Availability zone in which you want the resource to be created"  
}

variable "backup_vault_name" {
    description = "Name of the backup vault"
    type = string
    
  
}

variable "iam_role_name" {
    description = "Role name for the backup"
    type = string
  
}

variable "iam_policy_name" {
    description = "IAM policy name"
    type = string
    
  
}

variable "backup_policy_attachement_name" {
    description = "backup policy attachment name"
    type = string
}

variable "backup_selection_name" {
    description = "Backup selection name"
    type = string
  
}