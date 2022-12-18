variable "vpc_flow_logs_bucket_name" {
  type        = string
  description = "Name of the VPC flow logs bucket"
  default     = "gcs-use4-flowlogs"
}

variable "project_prefix" {
  type = string
}

variable "log_sink_name" {
  type        = string
  description = "Name of the Log Sink"
  default     = "logsink-use4-flowlogs"
}

variable "project" {
  type        = string
  description = "The GCP project for Logging"
}
