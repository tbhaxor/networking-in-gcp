resource "google_compute_instance" "cloud-loadtest" {
  name         = "cloud-loadtest"
  zone         = "us-east1-b"
  machine_type = "n1-standard-4"

  metadata_startup_script = "sudo apt-get install iperf -y"

  boot_disk {
    auto_delete = true
    device_name = "cloud-loadtest"
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network    = google_compute_network.cloud.name
    subnetwork = google_compute_subnetwork.cloud-east.name
    access_config {

    }
  }

  depends_on = [
    google_compute_network.cloud,
    google_compute_subnetwork.cloud-east
  ]
}


resource "google_compute_instance" "on-prem-loadtest" {
  name         = "on-prem-loadtest"
  zone         = "us-central1-a"
  machine_type = "n1-standard-4"

  metadata_startup_script = "sudo apt-get install iperf -y"

  boot_disk {
    auto_delete = true
    device_name = "cloud-loadtest"
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 10
      type  = "pd-standard"
    }
  }

  network_interface {
    network    = google_compute_network.on-prem.name
    subnetwork = google_compute_subnetwork.on-prem-central.name
    access_config {

    }
  }

  depends_on = [
    google_compute_network.on-prem,
    google_compute_subnetwork.on-prem-central
  ]
}
