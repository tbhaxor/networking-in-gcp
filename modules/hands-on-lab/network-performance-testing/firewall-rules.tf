resource "google_compute_firewall" "iperf-testing" {
  name    = "iperf-testing"
  network = data.google_compute_network.default.name

  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["5001"]
  }

  allow {
    protocol = "udp"
    ports    = ["5001"]
  }

  source_ranges = ["0.0.0.0/0"]
}
