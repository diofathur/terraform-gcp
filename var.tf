resource "google_compute_instance" "new" {
  name         = "test"
  machine_type = "f1-micro"
  zone         = "asia-southeast2-a"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  metadata_startup_script = file("./apache2.sh")

  network_interface {
    network = "default"
    access_config {
    }
  }

}

resource "google_compute_firewall" "web-server" {
  name    = "web-firewall"
  network = "default"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]
}