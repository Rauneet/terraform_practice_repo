module "dynamodb" {
  source             = "./dynamodb_autoscaling"
  region             = "ap-south-1"
  table_name         = "Users"
  target_value       = 50
  min_capacity_value = 3
  max_capacity_value = 50
  service_namespace  = "dynamodb"
  hash_key_value     = "UserID"

}