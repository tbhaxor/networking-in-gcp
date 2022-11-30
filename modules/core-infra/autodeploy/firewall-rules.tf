resource "google_compute_firewall" "mynetwork-allow-http-ssh-rdp-icmp" {
  name          = "mynetwork-allow-http-ssh-rdp-icmp"
  network       = google_compute_network.mynetwork.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "3389"]
  }

  allow {
    protocol = "icmp"
  }

  depends_on = [
    google_compute_network.mynetwork
  ]
}
