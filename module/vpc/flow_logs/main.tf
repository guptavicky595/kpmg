resource "google_storage_bucket" "vpc-flow-logs" {
  name          = "${var.project_prefix}-${var.vpc_flow_logs_bucket_name}-${var.project}"
  force_destroy = true

}

resource "google_logging_project_sink" "storage-sink" {
  name                   = "${var.project_prefix}-${var.log_sink_name}"
  destination            = "storage.googleapis.com/${google_storage_bucket.vpc-flow-logs.name}"
  filter                 = "resource.type=gce_subnetwork AND logName=projects/${var.project}/logs/compute.googleapis.com%2Fvpc_flows"
  unique_writer_identity = false
}
