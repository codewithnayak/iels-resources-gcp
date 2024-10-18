terraform {
  backend "gcs" {
    bucket     = "iels-tf-remote-state-file"
    prefix     = "k8"  # Optional: Set a prefix for your state files
  }
}

