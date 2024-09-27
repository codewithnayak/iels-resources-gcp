terraform {
  backend "gcs" {
    bucket     = "iels-terraform-state-file"
    prefix     = "iam"  # Optional: Set a prefix for your state files
  }
}