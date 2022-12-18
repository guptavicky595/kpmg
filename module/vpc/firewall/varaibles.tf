variable "custom_vpc_selflink" {
  type        = string
  description = "Self Link of VPC network"
}

variable "project_prefix" {
  type = string
}

variable "project" {
  type        = string
  description = "Project ID"
}

variable "region" {
  type        = string
  description = "Region"
}

variable "jenkins_internal_ip" {
  type        = string
  description = "Jenkins Internal IP"
}

variable "jenkins_tag" {
  type        = string
  default     = "ce-use4-jenkins-deployment"
  description = "The network tag for Jenkins server"
}

variable "etl_tag" {
  type        = string
  default     = "ce-use4-etl-deployment"
  description = "The network tag for ETL server"
}

variable "jenkins_source_cidr" {
  type        = list(string)
  default     = ["223.187.139.84"]
  description = "The list of allowed source IP ranged for Jenkins"
}

variable "etl_source_cidr" {
  type        = list(string)
  default     = ["10.211.128.0/25", "10.4.16.0/20", "10.12.0.0/14"]
  description = "The list of allowed source IP ranged for ETL"
}

variable "etl_ssh_source_cidr" {
  type        = list(string)
  default     = ["47.32.117.61"]
  description = "The list of allowed IPs for ETL SSH"
}
