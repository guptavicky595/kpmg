resource "google_compute_disk" "jenkins_disk" {
  name     = "${var.project_prefix}-${var.jenkins_disk_name}"
  type     = var.jenkins_disk_type
  zone     = var.zone
  snapshot = var.jenkins_disk_snapshot
}


// https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/google_service_account_iam
resource "google_service_account" "jenkins_sa" {
  account_id   = "${var.project_prefix}-${var.jenkins_sa_account_id}"
  display_name = var.jenkins_sa_display_name
}

// Storage, Secret Manager, Firebase, Functions, SA User
resource "google_project_iam_member" "sa-iam-roles" {
  for_each = toset(var.sa_roles)

  role   = each.key
  member = "serviceAccount:${google_service_account.jenkins_sa.email}"
}

resource "google_compute_address" "jenkins_static_ip_address" {
  name = var.jenkins_static_ip_address_name
}

resource "google_compute_instance" "jenkins_vm" {
  name         = "${var.project_prefix}-${var.jenkins_vm_name}"
  machine_type = var.jenkins_vm_machine_type
  zone         = var.zone

  tags = ["${var.project_prefix}-${var.jenkins_vm_tags}"]

  boot_disk {
    source = google_compute_disk.jenkins_disk.self_link
  }

  network_interface {
    subnetwork = var.app_subnet_selflink
    network_ip = var.jenkins_private_ip

    access_config {
      nat_ip = google_compute_address.jenkins_static_ip_address.address
    }
  }

  labels = {
    enable-osconfig = "true"
  }

  deletion_protection       = true
  allow_stopping_for_update = true

  service_account {
    email  = google_service_account.jenkins_sa.email
    scopes = var.jenkins_vm_scopes
  }
}
