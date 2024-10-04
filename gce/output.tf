output "external_ip" {
  value = google_compute_instance.vm_instance.network_interface.access_config.nat_ip
}