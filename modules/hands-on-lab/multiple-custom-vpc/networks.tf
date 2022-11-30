resource "google_compute_network" "labnet" {
  name                    = "labnet"
  project                 = var.project_id
  auto_create_subnetworks = false
}

resource "google_compute_network" "privatenet" {
  name                    = "privatenet"
  project                 = var.project_id
  auto_create_subnetworks = false
}
