resource "google_compute_network" "cloud" {
  name                    = "cloud"
  project                 = var.project_id
  auto_create_subnetworks = false
}


resource "google_compute_network" "on-prem" {
  name                    = "on-prem"
  project                 = var.project_id
  auto_create_subnetworks = false
}
