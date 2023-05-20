# Creating gcloud compute VM
resource "google_compute_instance" "test-vm" {
  name = "ubuntu-test-vm"
  machine_type = "n1-standard-1"
  zone = "us-central1-a"

  boot_disk {
    initialize_params {
        image = "debian-11-bullseye-v20230509"
        type  = "pd-standard"
        size  = "10"
    }
  }

   network_interface {
     network = "default"
   }

}