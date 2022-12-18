resource "google_compute_global_address" "private_ip_address" {
  name          = "${var.project_prefix}-${var.pvt_ip_name}"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = var.network
}

resource "google_service_networking_connection" "private_vpc_connection" {
  depends_on              = [google_compute_global_address.private_ip_address]
  network                 = var.network
  service                 = var.api
  reserved_peering_ranges = [google_compute_global_address.private_ip_address.name]
}

resource "random_id" "db_name_suffix" {
  byte_length = 4
}

resource "google_sql_database_instance" "sql_master" {
  depends_on          = [google_service_networking_connection.private_vpc_connection]
  name                = "${var.project_prefix}-${var.sql_instance_name}-${random_id.db_name_suffix.hex}"
  database_version    = var.database_version
  region              = var.region
  deletion_protection = "false"

  restore_backup_context {
    backup_run_id = var.sql_backup_run_id
    instance_id   = var.sql_backup_instance_id
    project       = var.backup_project
  }

  settings {
    tier = var.tier #1 vCPU and 3.75GB RAM (3.75*1024=3840MiB)
    //disk_size = var.disk_size
    disk_type = var.disk_type
    user_labels = {
      "environment" = "prod-sql"
    }
    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
    }
    location_preference {
      zone = var.zone
    }
    ip_configuration {
      private_network = "projects/${var.project}/global/networks/${var.network}"
    }
  }
}
