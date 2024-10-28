output "random" {
  value = random_string.random.lower
}

output "users_from_yaml" {
  description = "Output to see the result"
  value       = local.users_from_yaml

}

output "password" {
  # for each meta-argument is used we access the each users password
  value = { for key, value in aws_iam_user_login_profile.iam_user_login : key => value.encrypted_password }
}

output "role_policy_list" {
    value = local.role_policies_list
}