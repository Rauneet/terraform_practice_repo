locals {
  backups = {
    schedule  = "cron(0 5 ? * MON-FRI *)"
    retention = 7
  }
}


# AWS vault

resource "aws_backup_vault" "demo_backup_vault" {
    name = "${var.project_name}-backup-vault"
    force_destroy = true
    tags = {
        Name = "demo-backup-vault"
        project = var.project_name
        backup = true
    } 

}

resource "aws_backup_plan" "backup_plan" {
  name = "${var.project_name}-backup-plan"

  rule {
    rule_name         = "Weekdays-every-2-hours-${local.backups.retention}-day-rentention"
    target_vault_name = aws_backup_vault.demo_backup_vault.name
    schedule          = local.backups.schedule
    start_window = 60
    completion_window = 300
    recovery_point_tags = {
        project = var.project_name
        role = "backup"
        creator = "aws-backups"
    }

    lifecycle {
      delete_after = local.backups.retention
    }
  }
  tags = {
    project = var.project_name
  }
}

resource "aws_backup_selection" "backup_selection" {
    iam_role_arn = aws_iam_role.backup_admin_role.arn
    plan_id = aws_backup_plan.backup_plan.id
    name = var.backup_selection_name
    selection_tag {
        type  = "STRINGEQUALS"
        key   = "Backup"
        value = "true"
    }
  
}