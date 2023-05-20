output "vm_names" {
  value = [for i in google_compute_instance.nginx_vm: i.name]
}

output "vm_external_ip" {
  value = {for vm, ip in google_compute_instance.nginx_vm: vm => ip.network_interface.0.access_config.0.nat_ip}
}

output "vm_internal_ip" {
  value = {for vm, ip in google_compute_instance.nginx_vm: vm => ip.network_interface.0.network_ip}
}