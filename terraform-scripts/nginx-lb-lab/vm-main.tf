data "template_file" "nginx" {

  template = "${file("${path.module}/template/install_nginx.tpl")}"
  
}

# Creating gcloud compute VM
resource "google_compute_instance" "nginx_vm" {
  
  for_each = {for vm in var.virtual_machines: vm.name => vm}

  name = each.value.name
  machine_type = each.value.instance_type
  zone = var.gcp_zone
  tags = each.value.tags

  boot_disk {
    initialize_params {
        image = each.value.boot_disk_image
        type  = each.value.boot_disk_type
        size  = each.value.boot_disk_size
    }
  }

   network_interface {
     network    = google_compute_network.vpc.name
     subnetwork = google_compute_subnetwork.network_subnet.name
     access_config {
       # To get external access
     }
   }

  metadata_startup_script = data.template_file.nginx.rendered

  timeouts {
    create = "1h30m"
    update = "2h"
    delete = "20m"
  }
}