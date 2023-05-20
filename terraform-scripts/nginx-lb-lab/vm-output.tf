# output "vm_name" {
#   value = { for vm in google_compute_instance.nginx_vm.name }
# }

# output "vm_external_ip" {
#   value = google_compute_instance.vm_instance_public.network_interface.0.access_config.0.nat_ip
# }

# output "vm_internal_ip" {
#   value = google_compute_instance.vm_instance_public.network_interface.0.network_ip
# }