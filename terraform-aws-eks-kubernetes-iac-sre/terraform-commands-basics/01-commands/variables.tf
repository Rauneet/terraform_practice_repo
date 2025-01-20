variable "instance_type" {
  type = map(string)
  default = {
    "dev"   = "t2.micro"
    "stage" = "t3.small"
    "prod"  = "t3.medium"
  }

}