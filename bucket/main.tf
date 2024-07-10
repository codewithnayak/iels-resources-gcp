resource "random_string" "bucket_name_random_string" {
  length = 8
  lower = true
  upper = false
  special = false
  #override_special = "/@£$"  # You can customize special characters
}

output "random_string_result" {
  value = random_string.bucket_name_random_string.result
}

resource "google_storage_bucket" "my_bucket" {
  name     = "iels-bucket-${random_string.bucket_name_random_string.result}"
  location = var.region
  labels = {
    journey = local.journey
    steam = local.stream
  }
}


locals {
  journey = "iels"
  stream = "api"
}