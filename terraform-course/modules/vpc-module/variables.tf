# variable "cidr" {
#   type = map(any)
# }

# variable "azs" {
#   type = map(any)
# }

# variable "availability_zone" {
#     type = map(any)
# }

# variable "instance_type" {
#     type = map(any)
# }

variable "name" {
  type        = string
  description = "Name of the VPC"
  default     = null # Default to null if not provided
}

variable "cidr" {
  type        = string
  description = "CIDR block for the VPC"
  default     = null
  validation {
    condition = can(cidrnetmask(var.cidr))
    error_message = "Provided value for the cidr is invalid!! Plaese provide the correct cidr range!!"
  }
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet CIDR blocks"
  default     = []
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet CIDR blocks"
  default     = []
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default     = {}
}


variable "availability_zone" {
    type = string
    default = null
}

variable "instance_type" {
    type = string
    default = null
  
}