resource "google_project_service" "kubernetes" {
  service = "container.googleapis.com"
}

resource "google_project_service" "gcr" {
  service = "containerregistry.googleapis.com"
}
