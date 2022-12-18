variable "project" {
  type        = string
  description = "Project ID"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "users" {
  type        = list(string)
  description = "List of users to be given IAM permissions"
  default = ["user:guptavicky595@gmail.com"]
}
