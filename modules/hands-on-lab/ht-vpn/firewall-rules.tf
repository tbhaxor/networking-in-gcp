resource "google_compute_firewall" "cloud-fw" {
  name          = "cloud-fw"
  network       = google_compute_network.cloud.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["5001"]
  }

  allow {
    protocol = "udp"
    ports    = ["5001"]
  }

  allow {
    protocol = "icmp"
  }

  depends_on = [
    google_compute_network.cloud
  ]
}


resource "google_compute_firewall" "on-prem-fw" {
  name          = "on-prem-fw"
  network       = google_compute_network.on-prem.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  allow {
    protocol = "tcp"
    ports    = ["5001"]
  }

  allow {
    protocol = "udp"
    ports    = ["5001"]
  }

  allow {
    protocol = "icmp"
  }

  depends_on = [
    google_compute_network.on-prem
  ]
}
