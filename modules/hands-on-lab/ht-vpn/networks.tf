resource "google_compute_network" "cloud" {
  name                    = "cloud"
  auto_create_subnetworks = false
}


resource "google_compute_network" "on-prem" {
  name                    = "on-prem"
  auto_create_subnetworks = false
}
