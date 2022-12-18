variable "project" {
  type        = string
  description = "Project ID"
}

variable "project_prefix" {
  type = string
}

variable "region" {
  type        = string
  description = "Region"
}

variable "zone" {
  type        = string
  description = "Availability Zone"
}

variable "jenkins_disk_name" {
  type        = string
  description = "Name of Jenkins Disk"
  default     = "jenkins-disk"
}

variable "jenkins_disk_type" {
  type        = string
  description = "Type of Jenkins Disk"
  default     = "pd-standard"
}

variable "jenkins_disk_snapshot" {
  type        = string
  description = "Snapshot to create Jenkins Disk"
}


variable "jenkins_sa_account_id" {
  type        = string
  description = "Account ID of Jenkins Service Account"
  default     = "jenkin"
}

variable "jenkins_sa_display_name" {
  type        = string
  description = "Display name of Jenkins Service Account"
  default     = "Byzzer Jenkins Service Account"
}

variable "jenkins_static_ip_address_name" {
  type        = string
  description = "Static IP for Jenkins VM"
  default     = "jenkins-static-ip-address"
}

variable "app_subnet_selflink" {
  type        = string
  description = "Selflink for app subnet"
}

variable "sa_roles" {
  type        = list(string)
  description = "List of roles to be granted to Jenkins Service Account"
  default = ["roles/secretmanager.admin", "roles/storage.admin",
  "roles/iam.serviceAccountUser", "roles/firebase.admin", "roles/cloudfunctions.admin", "roles/logging.admin", "roles/monitoring.admin", "roles/compute.admin"]
}

variable "jenkins_vm_name" {
  type        = string
  description = "Name of Jenkins VM"
  default     = "ce-use4-jenkins-vm"
}

variable "jenkins_vm_machine_type" {
  type        = string
  description = "Machine type of Jenkins VM"
  default     = "n1-standard-1"
}

variable "jenkins_vm_tags" {
  type        = string
  description = "Tags attached to Jenkins VM"
  default     = "ce-use4-jenkins-deployment"
}

variable "jenkins_vm_scopes" {
  type        = list(string)
  description = "Scope of service account of Jenkins VM"
  default     = ["cloud-platform"]
}

variable "jenkins_private_ip" {
  type        = string
  description = "Private IP assigned to Jenkins VM"
  default     = "10.211.128.2"
}
