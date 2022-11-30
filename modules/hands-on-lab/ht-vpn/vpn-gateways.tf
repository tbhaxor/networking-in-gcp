resource "google_compute_vpn_gateway" "cloud-gw1" {
  name    = "cloud-gw1"
  network = google_compute_network.cloud.name
  region  = "us-east1"

  depends_on = [
    google_compute_network.cloud
  ]
}

resource "google_compute_vpn_gateway" "on-prem-gw1" {
  name    = "on-prem-gw1"
  network = google_compute_network.on-prem.name
  region  = "us-central1"

  depends_on = [
    google_compute_network.on-prem
  ]
}
