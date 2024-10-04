resource "google_service_account" "default" {
  account_id   = var.service_account_id
  display_name = var.display_name
}

resource "google_compute_instance" "vm_instance" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.region

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      labels = {
        project = "IELS"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral  public IP
    }
  }

   metadata = {
    automated = true
    tf = "yes"
    prject = "IELS"
  }

  metadata_startup_script = "echo hi > /test.txt"

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }
}


