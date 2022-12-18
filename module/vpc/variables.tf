variable "region" {
  type        = string
  description = "Region"
}

variable "project_prefix" {
  type = string
}

variable "cidr_app" {
  type        = string
  description = "CIDR for App Subnet"
}

variable "cidr_db" {
  type        = string
  description = "CIDR for DB Subnet"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
  default     = "vpc-use4-network"
}

variable "app_subnet_name" {
  type        = string
  description = "Name of the App Subnet"
  default     = "subnet-use4-app-subnet"
}

variable "db_subnet_name" {
  type        = string
  description = "Name of the Database subnet"
  default     = "subnet-use4-db-subnet"
}

variable "router_name" {
  type        = string
  description = "Name of the Cloud Router"
  default     = "rt-use4"
}

variable "nat_name" {
  type        = string
  description = "Name of the Cloud NAT"
  default     = "nat-use4"
}
