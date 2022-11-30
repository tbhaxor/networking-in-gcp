resource "google_compute_subnetwork" "cloud-east" {
  name          = "cloud-east"
  network       = google_compute_network.cloud.name
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-east1"

  depends_on = [
    google_compute_network.cloud
  ]
}


resource "google_compute_subnetwork" "on-prem-central" {
  name          = "on-prem-central"
  network       = google_compute_network.on-prem.name
  ip_cidr_range = "192.168.1.0/24"
  region        = "us-central1"

  depends_on = [
    google_compute_network.on-prem
  ]
}
