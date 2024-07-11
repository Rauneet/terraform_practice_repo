resource "aws_iam_role" "backup_admin_role" {
  name               = var.iam_role_name
  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "Service": "backup.amazonaws.com"
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })

  tags = {
    Name = var.iam_role_name
  }
}

resource "aws_iam_role_policy_attachment" "backup_policy_attachment" {
  role       = aws_iam_role.backup_admin_role.name
  policy_arn = data.aws_iam_policy.backup_full_access.arn

}
