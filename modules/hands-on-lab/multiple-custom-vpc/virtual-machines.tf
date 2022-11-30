

resource "google_compute_instance" "pnet-vm" {
  name         = "pnet-vm"
  machine_type = "n1-standard-1"
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }


  network_interface {
    network    = google_compute_network.privatenet.name
    subnetwork = google_compute_subnetwork.privatenet-sub.name

    access_config {
      # for ephemeral external ip
    }
  }

  depends_on = [
    google_compute_subnetwork.privatenet-sub,
  ]
}


resource "google_compute_instance" "lnet-vm" {
  name         = "lnet-vm"
  machine_type = "n1-standard-1"
  zone         = var.zone
  project      = var.project_id

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }


  network_interface {
    network    = google_compute_network.labnet.name
    subnetwork = google_compute_subnetwork.labnet-sub.name

    access_config {
      # for ephemeral external ip
    }
  }

  depends_on = [
    google_compute_subnetwork.labnet-sub
  ]
}
