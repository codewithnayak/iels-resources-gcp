output "external_ip" {
  value = [for instance in data.google_compute_instance.example_group : google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip]
}