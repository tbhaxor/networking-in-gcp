resource "google_compute_firewall" "labnet-allow-internal" {
  name          = "labnet-allow-internal"
  network       = google_compute_network.labnet.name
  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  depends_on = [
    google_compute_network.labnet
  ]
}

resource "google_compute_firewall" "privatenet-deny" {
  name          = "privatenet-deny"
  network       = google_compute_network.privatenet.name
  source_ranges = ["0.0.0.0/0"]

  deny {
    protocol = "icmp"
  }

  deny {
    protocol = "tcp"
    ports    = ["22"]
  }

  depends_on = [
    google_compute_network.privatenet
  ]
}
