# output "external_ips" {
#   value = [for instance in data.google_compute_instance.example_instances : instance.network_interface[0].access_config[0].nat_ip]
# }