variable "rdsdb_identifier" {
  description = "The name of the RDS instance"
  type        = string
}

variable "rds_db_name" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
}

variable "rds_username" {
  description = "Username for the RDS DB"
  type        = string

}

variable "rds_port" {
  description = "The port on which the DB accepts connections"
  type        = number
  default     = 3306

}

variable "db_password" {
  description = "Password of the RDS DB"
  sensitive   = true

}