# Terraform 

provider "google" {
  project = var.project
  region  = var.region
  version = "~> 3.56"
}

provider "google-beta" {
  project = var.project
  region  = var.region
  version = "~> 3.56"
}
