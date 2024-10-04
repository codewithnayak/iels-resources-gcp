terraform {
  backend "gcs" {
    bucket     = "iels-terraform-state-file"
    prefix     = "gce"  # Optional: Set a prefix for your state files
  }
}