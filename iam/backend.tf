terraform {
  backend "gcs" {
    bucket     = "iels-terraform-state"
    prefix     = "iam"  # Optional: Set a prefix for your state files
    
  }
}


