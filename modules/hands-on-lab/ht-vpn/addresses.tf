resource "google_compute_address" "cloud-gw1" {
  name   = "cloud-gw1"
  region = "us-east1"
}

resource "google_compute_address" "on-prem-gw1" {
  name   = "on-prem-gw1"
  region = "us-central1"
}
