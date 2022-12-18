output "jenkins_external_ip" {
  description = "The public IPv4 address of jenkins instance."
  value       = google_compute_instance.jenkins_vm.network_interface.0.access_config.0.nat_ip
}

output "jenkins_internal_ip" {
  description = "The private IPv4 address of jenkins instance."
  value       = google_compute_instance.jenkins_vm.network_interface.0.network_ip
}

output "jenkins_id" {
  description = "The ID of the created Jenkins instance."
  value       = google_compute_instance.jenkins_vm.id
}

output "jenkins_disk_name" {
  description = "The name of the created Jenkins Disk."
  value       = google_compute_disk.jenkins_disk.name
}
