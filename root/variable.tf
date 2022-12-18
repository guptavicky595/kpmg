variable "project" {
  type        = string
  description = "Project ID"
  default     = "byzzer-terraform-test"
}

variable "project_prefix" {
  type        = string
  description = "Common project prefix"
}

variable "region" {
  type        = string
  description = "Region"
  default     = "us-east4"
}

variable "zone" {
  type        = string
  description = "zone"
  default     = "us-east4-c"
}

variable "cidr_app" {
  type        = string
  description = "CIDR for App Subnet"
}

variable "cidr_db" {
  type        = string
  description = "CIDR for DB Subnet"
}

variable "jenkins_disk_snapshot" {
  type        = string
  description = "Snapshot to create Jenkins Disk"
}



