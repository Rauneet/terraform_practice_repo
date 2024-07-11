output "backup_vault_arn" {
    value = aws_backup_vault.demo_backup_vault.arn
  
}

output "backup_plan_arn" {
    value = aws_backup_plan.backup_plan.arn
  
}

output "aws_backup_selection_arn" {
    value = aws_backup_selection.backup_selection.name
  
}

output "iam_role_arn" {
    value = aws_iam_role.backup_admin_role.arn
  
}

output "aws_iam_role_policy_attachment" {
    value = aws_iam_role_policy_attachment.backup_policy_attachment.policy_arn  
}