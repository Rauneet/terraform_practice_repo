# read the current account 
data "aws_caller_identity" "current" {}

# Generates an IAM policy document in JSON format for use with resources that expect policy documents such as aws_iam_policy.
# fetches the iam policy document 
data "aws_iam_policy_document" "assume_role_policy" {
  for_each = toset(keys(local.role_policies))   // for each of the roles readonly, admin, auditor, developer get the keys 
  statement {                                   // which role can assume the policy
    sid = "1"
  }
  statement {
    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "AWS"
      identifiers = [
        for username in keys(aws_iam_user.users) :
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${username}"
        if contains(local.users_map[username], each.key) # Move the 'if' condition inside the 'for' loop


        # for username in keys(aws_iam_user.users) : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${username}"
        # if contains(local.users_map[username], each.value)

        # for username in keys(aws_iam_user.users) : 
        # "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${username}"
        # if anytrue([for role in local.users_map[username] : contains(local.role_policies[role], each.key)])

        # for username in keys(aws_iam_user.users) : 
        # "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${username}"
        # if anytrue([for role in local.users_map[username] : contains(local.role_policies[role], role)])

        # for username in keys(aws_iam_user.users) : 
        # "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/${username}"
        # if length([for role in local.users_map[username] : role if contains(keys(local.role_policies), role)]) > 0
      ]
    }
  }

}

data "aws_iam_policy" "managed_policies" {
  for_each = toset(local.role_policies_list[*].policy)
  arn      = "arn:aws:iam::aws:policy/${each.value}"
}

