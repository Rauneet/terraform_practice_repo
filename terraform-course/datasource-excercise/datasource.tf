# # This datasource is used to fetch the account id user id as well as the arn in which the terraform is authorized 
# data "aws_caller_identity" "current" {}

# # output block for the caller identity

# output "account_id" {
#     value = data.aws_caller_identity.current.account_id
# }

# output "arn" {
#     value = data.aws_caller_identity.current.arn
# }

# output "user_id" {
#     value = data.aws_caller_identity.current.user_id
# }


# datasource to fetch the vpc details

# data "aws_vpc" "selected" {
#     id = "vpc-00f971367a49a1d8a"
  
# }

# output "vpc_cidr_block" {
#     value = data.aws_vpc.selected.cidr_block
  
# }

# output "vpc_id" {
#     value = data.aws_vpc.selected.id
  
# }

# output "dhcp" {
#     value = data.aws_vpc.selected.dhcp_options_id
  
# }

# This data source can be used to fetch information about a specific IAM policy.

# data "aws_iam_policy" "custom_policy" {
#     # by arn we can fetch or
#     # arn = ""

#     # or by name we can fetch 
#     name = "s3custompolicy"
  
# }

# output "custom_policy" {
#     value = data.aws_iam_policy.custom_policy.policy
  
# }

# output "custom_policy_id" {
#     value = data.aws_iam_policy.custom_policy.id
  
# }


# provide the value in HCL and this datasource will convert into json format
# data "aws_iam_policy_document" "example" {
#     statement {
#       sid = "custom-s3-policy"
#       actions = [ "s3:Get*",
#       "s3:List*"
#     ]
#     resources = [ "arn:aws:s3:::*" ]
#     }
# }

# output "test_json" {
#     value = data.aws_iam_policy_document.example.json
  
# }

# data "aws_iam_role" "example" {
#   name = "test-raun"
# }

# output "test" {
#     value = data.aws_iam_role.example.arn
  
# }

#################################################################################################################################

# data "" "name" {
  
# }