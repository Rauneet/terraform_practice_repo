# Create a DynamoDB Table with Autoscaling
# Create a Terraform module that provisions a DynamoDB table with autoscaling enabled for read and write capacity. 
# The module should accept parameters for table name, primary key schema, 
# and autoscaling settings. Requirements: Table name Primary key schema (attribute names and types) 
# Autoscaling settings (min and max read/write capacity units)


resource "aws_dynamodb_table" "basic_dynamodb_table" {
  name           = var.table_name
  billing_mode   = var.billing_mode
  read_capacity  = var.read_capacity_value
  write_capacity = var.write_capacity_value
  hash_key       = var.hash_key_value
  attribute {
    name = var.hash_key_value
    type = "S"
  }
  tags = {
    Name = "Users"
    Environment = "Dev"
  }

}

resource "aws_appautoscaling_target" "dynamodb_table_read_target" {
  max_capacity       = var.max_capacity_value
  min_capacity       = var.min_capacity_value
  resource_id        = "table/${aws_dynamodb_table.basic_dynamodb_table.name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = var.service_namespace
}

resource "aws_appautoscaling_policy" "dynamodb_read_scaling_policy" {
    name = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_read_target.resource_id}"
    resource_id = "DynamoDB:${aws_appautoscaling_target.dynamodb_table_read_target.resource_id}"
    scalable_dimension = aws_appautoscaling_target.dynamodb_table_read_target.scalable_dimension
    service_namespace = aws_appautoscaling_target.dynamodb_table_read_target.service_namespace
    target_tracking_scaling_policy_configuration {
      predefined_metric_specification {
        predefined_metric_type = "DynamoDBReadCapacityUtilization"
      }
      target_value = var.target_value
    }
  
}

resource "aws_appautoscaling_target" "dynamodb_table_write_target" {
  max_capacity       = var.max_capacity_value
  min_capacity       = var.min_capacity_value
  resource_id        = "table/${aws_dynamodb_table.basic_dynamodb_table.name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = var.service_namespace
}

resource "aws_appautoscaling_policy" "dynamodb_write_scaling_policy" {
    name = "DynamoDBReadCapacityUtilization:${aws_appautoscaling_target.dynamodb_table_read_target.resource_id}"
    resource_id = "DynamoDB:${aws_appautoscaling_target.dynamodb_table_read_target.resource_id}"
    scalable_dimension = aws_appautoscaling_target.dynamodb_table_read_target.scalable_dimension
    service_namespace = aws_appautoscaling_target.dynamodb_table_read_target.service_namespace
    target_tracking_scaling_policy_configuration {
      predefined_metric_specification {
        predefined_metric_type = "DynamoDBWriteCapacityUtilization"
      }
      target_value = var.target_value
    }
  
}

