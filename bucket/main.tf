resource "google_storage_bucket" "my_bucket" {
  name     = "my-gcs-bucket"
  location = var.region
}