terraform {
  backend "gcs" {
    bucket     = "iels-terraform-state"
    prefix     = "terraform/state"  # Optional: Set a prefix for your state files
    credentials = "path/to/your/creds.json"  # Path to your GCP service account credentials
  }
}


