resource "google_compute_instance_template" "iels_instance_template" {
  name         = var.instance_template_name
  machine_type = var.machine_type

  disk {
    source_image = "ubuntu-os-cloud/ubuntu-2204-lts"
    auto_delete  = true
    boot         = true
  }

  network_interface {
    network = "default"
    access_config {}
  }

  metadata = {
    startup-script = file("./startup-script.sh")
  }

  tags = var.allow_http ? ["http-server"] : []
}

resource "google_compute_instance_group_manager" "iels_instance_group" {
  name               = var.instance_group_name
  base_instance_name = var.instance_group_base_name
  zone               = var.zone
  target_size        = var.size
  version {
    instance_template = google_compute_instance_template.iels_instance_template.self_link
  }
}

resource "google_compute_firewall" "default" {
  count = var.allow_http ? 1 : 0
  name    = "allow-http"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

data "google_compute_instance" "example_instances" {
  # Loop through each instance in the MIG
  for_each = data.google_compute_instance_group_manager.mig.instance_group.self_link
  zone     = var.zone  # Replace with the zone your instances are in
  self_link = each.value      # Get each instance's self-link
}

