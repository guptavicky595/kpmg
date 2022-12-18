output "custom_vpc_selflink" {
  description = "Selflink of Custom VPC"
  value       = google_compute_network.custom_vpc.self_link
}

output "custom_vpc_name" {
  description = "Name of Custom VPC"
  value       = google_compute_network.custom_vpc.name
}

output "app_subnet_selflink" {
  description = "Selflink of App Subnet"
  value       = google_compute_subnetwork.app-subnet.self_link
}

output "db_subnet_selflink" {
  description = "Selflink of DB Subnet"
  value       = google_compute_subnetwork.db-subnet.self_link
}

output "primary_ip_range" {
  description = "Primary IP Range of App Subnet"
  value       = tolist([google_compute_subnetwork.app-subnet.ip_cidr_range])
}

output "secondary_ip_range" {
  description = "Secondary IP Range of App Subnet"
  value = toset([
    for ip in google_compute_subnetwork.app-subnet.secondary_ip_range : ip.ip_cidr_range
  ])
}
