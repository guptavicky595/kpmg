resource "google_compute_firewall" "jenkin_fw" {
  name    = "${var.project_prefix}-fw-internet-tcp-80-443-allow"
  network = var.custom_vpc_selflink

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_ranges = concat(var.jenkins_source_cidr, ["${var.jenkins_internal_ip}/32"])
  target_tags   = ["${var.project_prefix}-${var.jenkins_tag}"]
  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }

}

resource "google_compute_firewall" "etl_fw" {
  name    = "default-allow-http-8080"
  network = var.custom_vpc_selflink

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["8080"]
  }

  source_ranges = var.etl_source_cidr
  target_tags   = ["${var.project_prefix}-${var.etl_tag}"]
  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "etl_ssh_fw" {
  name    = "${var.project_prefix}-etl-fw-internet-tcp-22"
  network = var.custom_vpc_selflink

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.etl_ssh_source_cidr
  target_tags   = ["${var.project_prefix}-${var.etl_tag}"]
  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "jenkins_ssh_fw" {
  name    = "${var.project_prefix}-je-fw-internet-tcp-22"
  network = var.custom_vpc_selflink

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = var.jenkins_source_cidr
  target_tags   = ["${var.project_prefix}-${var.jenkins_tag}"]
  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}
