variable "region" {
    description = "Region value"
    type = string
  
}

variable "table_name" {
    description = "Name of the dynamodb table"
    type = string

}

variable "billing_mode" {
    description = "Billing mode for the dynamodb table"
    type = string
    default = "PROVISIONED"

}

variable "read_capacity_value" {
    description = "Value for read capacity of the table"
    type = number
    default = 5
  
}

variable "write_capacity_value" {
    description = "Write capacity of the table"
    type = number
    default = 5
  
}

variable "hash_key_value" {
    description = "hash key of the table"
    type = string
  
}


variable "max_capacity_value" {
    description = "Max capacity"
    type = number
  
}

variable "min_capacity_value" {
    description = "Min capacity"
    type = number
  
}

variable "service_namespace" {
    description = "Service namespace of the table"
    type = string
  
}

variable "target_value" {
    description = "target value for autoscaling"
    type = number
  
}