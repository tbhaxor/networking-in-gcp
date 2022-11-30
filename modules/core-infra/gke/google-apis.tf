resource "google_project_service" "kubernetes" {
  project = var.project_id
  service = "container.googleapis.com"
}

resource "google_project_service" "gcr" {
  project = var.project_id
  service = "containerregistry.googleapis.com"
}
