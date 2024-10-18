 provider "google" {
  project     = var.project
  region      = var.region
}


data "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.location
}

data "google_client_config" "default" {}


provider "kubernetes" {
  host                   = data.google_container_cluster.primary.endpoint
  cluster_ca_certificate = base64decode(data.google_container_cluster.primary.master_auth.cluster_ca_certificate)
  token                  = data.google_client_config.default.access_token
}
