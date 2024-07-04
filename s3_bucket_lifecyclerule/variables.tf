variable "state_bucket_name" {
  description = "state bucket name"
  type        = string
  default     = "state_bucket"

}

variable "artifact_bucket_name" {
  type        = string
  description = "artifact bucket name"
  default     = "artifact_bucket"
}

variable "deployment_context_bucket_name" {
  type        = string
  description = "deployment contect bucket name"
  default     = "deployement_context"

}

variable "force_destroy_value" {
  type        = bool
  description = "force destroy value for the s3 bucket"
  default     = false

}

variable "state_bucket_expiration_days" {
  type        = number
  description = "expiration days value"
  default     = 60

}

variable "artifact_bucket_expiration_days" {
  description = "expiration days value"
  type        = number
  default     = 30

}

variable "deployment_context_expiration_days" {
  type        = number
  description = "expiration days value"
  default     = 30

}

variable "noncurrent_version_expiration_days_for_state_bucket" {
  description = "noncurrent version expiration days value"
  type        = number
  default     = 60

}

variable "noncurrent_version_expiration_days_for_artifact_bucket" {
  description = "noncurrent version expiration days value for artifact bucket"
  type        = number
  default     = 30

}

variable "noncurrent_version_expiration_days_for_deployment_context_bucket" {
  description = "noncurrent version expiration days value for deployment context bucket"
  type        = number
  default     = 30
}

variable "noncurrent_version_transition_artifact_bucket" {
  description = "noncurrent_version_transition_artifact_bucket_value"
  default     = 30
  type        = number

}

variable "noncurrent_version_transition_deployment_context_bucket" {
  description = "noncurrent_version_transition_deployment_context_value"
  default     = 30
  type        = number

}

variable "storage_class_value" {
  type        = string
  description = "storage class value"
  default     = "GLACIER"

}



variable "tags" {
    type = map(string)
    description = "tags for the resources"
    default = {}
    
  
}