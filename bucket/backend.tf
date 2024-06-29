terraform {
  backend "gcs" {
    bucket     = "iels-terraform-state"
    prefix     = "terraform/state"  # Optional: Set a prefix for your state files
    
  }
}


