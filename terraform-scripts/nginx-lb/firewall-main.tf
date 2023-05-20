# HTTP port 80
resource "google_compute_firewall" "allow-http" {
  name    = "nginx-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  
  source_ranges = ["0.0.0.0/0"]
}

# HTTPS port 443
resource "google_compute_firewall" "allow-https" {
  name    = "nginx-fw-allow-https"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
}

# SSH port 22
resource "google_compute_firewall" "allow-ssh" {
  name    = "nginx-fw-allow-ssh"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}