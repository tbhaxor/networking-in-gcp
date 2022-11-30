resource "google_compute_subnetwork" "labnet-sub" {
  name    = "labnet-sub"
  network = google_compute_network.labnet.name
  project = var.project_id

  region        = "us-central1"
  ip_cidr_range = "10.0.0.0/28"

  depends_on = [
    google_compute_network.labnet
  ]
}



resource "google_compute_subnetwork" "privatenet-sub" {
  name    = "privatenet-sub"
  network = google_compute_network.privatenet.name
  project = var.project_id

  region        = "us-central1"
  ip_cidr_range = "10.1.0.0/28"

  depends_on = [
    google_compute_network.privatenet
  ]
}
