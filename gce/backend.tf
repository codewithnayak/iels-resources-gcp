terraform {
  backend "gcs" {
    bucket     = "iels-tf-remote-state-file"
    prefix     = "gce"  # Optional: Set a prefix for your state files
  }
}