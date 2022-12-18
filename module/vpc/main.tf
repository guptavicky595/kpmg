resource "google_compute_network" "custom_vpc" {
  name                    = "${var.project_prefix}-${var.vpc_name}"
  auto_create_subnetworks = false
  description             = "VPC for Byzzer production"
}

resource "google_compute_subnetwork" "app-subnet" {
  name                     = "${var.project_prefix}-${var.app_subnet_name}"
  ip_cidr_range            = var.cidr_app
  region                   = var.region
  network                  = google_compute_network.custom_vpc.id
  private_ip_google_access = true
  log_config {
    aggregation_interval = "INTERVAL_15_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_subnetwork" "db-subnet" {
  name          = "${var.project_prefix}-${var.db_subnet_name}"
  ip_cidr_range = var.cidr_db
  region        = var.region
  network       = google_compute_network.custom_vpc.id
  log_config {
    aggregation_interval = "INTERVAL_15_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_router" "router" {
  name    = "${var.project_prefix}-${var.router_name}"
  network = google_compute_network.custom_vpc.id
}

resource "google_compute_router_nat" "nat" {
  name                               = "${var.project_prefix}-${var.nat_name}"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
