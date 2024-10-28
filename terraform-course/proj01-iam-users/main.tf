locals {
  # yamldecode parses a string as a subset of YAML and produces a representation of its value.
  users_from_yaml = yamldecode(file("${path.module}/users.yaml"))
  project         = "proj01-iam-user"
  users_map = {
    for user_config in local.users_from_yaml.users : user_config.username => user_config.roles
  }
  tags = {
    Name        = "proj01-iam-user"
    Environment = "Dev"
  }
}


# locals block for roles
locals {
# role policies is map 
  role_policies = {
    readonly = [        // key: readonly
      "ReadOnlyAccess"  // value: ReadOnlyAccess
    ]
    admin = [           // key: admin
      "AdministratorAccess"  // value: AdministratorAccess
    ]
    auditor = [         // key: auditor
      "SecurityAudit"   // value: SecurityAudit
    ]
    developer = [       // key 
      "AmazonVPCFullAccess",
      "AmazonEC2FullAccess",  // values
      "AmazonRDSFullAccess"
    ]
  }

    role_policies_list = flatten([
        for role, policies in local.role_policies : [   // iterating over role_policies with the key: role, value: policies
        for policy in policies : {                      // iterating over the list of policies and then make the object 
        role   = role                                   // 1. role => readonly
        policy = policy                                             // policy: ReadOnlyAccess
      }                                                 // 2. role => admin
    ]                                                               // policy: AdministratorAccess
  ])                                                    // 3. role => developer
}                                                                   // policy: 1. AmazonVPCFullAccess 2.AmazonEC2FullAccess 3. AmazonRDSFullAccess
                                                                             


resource "random_string" "random" {
  length           = 8
  special          = true
  override_special = "/@£$"

}


resource "aws_iam_user" "users" {
  #   for_each = toset(local.users_from_yaml.users[*].username)
  #   for_each = toset([ for user_config in local.users_from_yaml.users: user_config.username ])
  for_each      = toset(local.users_from_yaml.users[*].username)    // iterating over the users 
  name          = each.value                                        // name of the user 
  force_destroy = true
  tags          = local.tags
}

######## Manages an IAM User Login Profile ###############

resource "aws_iam_user_login_profile" "iam_user_login" {
  #   user    = aws_iam_user.users.name
  for_each                = aws_iam_user.users
  user                    = each.value.name
  password_length         = 8
  password_reset_required = false
  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key
    ]
  }
  #   pgp_key = "keybase:some_person_that_exists"
}

########################################## Roles ######################################################

resource "aws_iam_role" "roles" {
  # for_each = toset([for user_roles in local.users_from_yaml.users: user_roles.roles])
  for_each           = toset(keys(local.role_policies))   // create the role : readonly , admin, auditor, developer
  name               = each.key                           // gives the name for the role : readonly , admin, auditor, developer as these are the keys in the map
  # for each of the key i.e admin, readonly, auditor, developer get the assume role policy
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy[each.key].json ## each.key  

}

# Attach the policy document to each role i.e readonly, admin, auditor, developer
resource "aws_iam_role_policy_attachment" "role_policy_attachments" {
  count = length(local.role_policies_list)
  role = aws_iam_role.roles[
    local.role_policies_list[count.index].role
  ].name
  policy_arn = data.aws_iam_policy.managed_policies[
    local.role_policies_list[count.index].policy
  ].arn
}