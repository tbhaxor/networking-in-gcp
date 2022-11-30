resource "google_compute_firewall" "allow-icmp-ssh" {
  name          = "allow-icmp-ssh"
  network       = google_compute_network.mynetwork.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  depends_on = [
    google_compute_network.mynetwork
  ]
}
