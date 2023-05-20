# Creating gcloud compute VM
resource "google_compute_instance" "nginx_vm" {
  name = "nginx-lb"
  machine_type = var.vm_spec["instance_type"]
  zone = var.gcp_zone
  tags = ["nginx"]

  boot_disk {
    initialize_params {
        image = var.vm_spec["boot_disk_image"]
        type  = var.vm_spec["boot_disk_type"]
        size  = var.vm_spec["boot_disk_size"]
    }
  }

   network_interface {
     network = "default"
   }

}