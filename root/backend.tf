terraform {
  backend "gcs" {
    bucket = "kpmg-test-backend"
    prefix = "terraform/state"
  }
}
