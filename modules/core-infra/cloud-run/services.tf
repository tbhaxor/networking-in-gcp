data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service" "helloworld" {
  name     = "helloworld"
  project  = var.project_id
  location = var.region

  template {
    spec {
      containers {
        image = var.gcr_image
        env {
          name  = "NAME"
          value = var.user_name
        }
      }
    }
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location = google_cloud_run_service.helloworld.location
  service  = google_cloud_run_service.helloworld.name

  policy_data = data.google_iam_policy.noauth.policy_data

  depends_on = [
    data.google_iam_policy.noauth
  ]
}
