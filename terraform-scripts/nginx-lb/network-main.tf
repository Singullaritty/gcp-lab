resource "google_compute_network" "vpc" {
  name                    = "nginx-lab-vpc"
  auto_create_subnetworks = "false"
  routing_mode            = "GLOBAL"
}

# create public subnet
resource "google_compute_subnetwork" "network_subnet" {
  name          = "nginx-lab-subnet"
  ip_cidr_range = var.network_subnet_cidr
  network       = google_compute_network.vpc.name
  region        = var.gcp_region
}