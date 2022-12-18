variable "project" {
  type        = string
  description = "Project ID"
}

variable "project_prefix" {
  type = string
}

variable "backup_project" {
  type        = string
  description = "Project ID where backup resides"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "zone" {
  type        = string
  description = "Availability Zone"
}

variable "network" {
  type        = string
  description = "Name of the network"
}

variable "tier" {
  type        = string
  description = "Machine type of instance"
  default     = "db-custom-1-3840"
}

variable "disk_size" {
  type        = string
  description = "Disk size for instance"
  default     = "20"
}

variable "disk_type" {
  type        = string
  description = "Disk type for instance"
  default     = "PD_SSD"
}

variable "database_version" {
  type        = string
  description = "Database version of instance"
  default     = "POSTGRES_12"
}

variable "api" {
  type        = string
  default     = "servicenetworking.googleapis.com"
  description = "The service used in the private VPC connection"
}

variable "pvt_ip_name" {
  type        = string
  default     = "private-ip"
  description = "The name of the SQL private IP"
}

variable "sql_instance_name" {
  type        = string
  default     = "sql-use4-prod"
  description = "The name of the SQL DB instance"
}

variable "sql_backup_instance_id" {
  type        = string
  description = "The backup instance ID from existing project for SQL"
}

variable "sql_backup_run_id" {
  type        = string
  description = "The backup run ID from existing project for SQL"
}
