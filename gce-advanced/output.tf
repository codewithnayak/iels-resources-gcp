output "external_ips" {
  value = [for instance in data.google_compute_instance.example_instances : instance.network_interface.access_config.nat_ip]
}