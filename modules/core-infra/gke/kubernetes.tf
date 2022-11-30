resource "google_container_cluster" "webfrontend" {
  name               = "webfrontend"
  network            = data.google_compute_network.default.name
  initial_node_count = 2
  location           = var.zone # this will create zonal cluster

  depends_on = [
    google_project_service.gcr,
    google_project_service.kubernetes
  ]
}
