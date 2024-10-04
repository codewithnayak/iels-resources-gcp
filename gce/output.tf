output "external_ip" {
  value = google_compute_instance.vm_instance.network_interface[0].access_config.nat_ip
}