resource "google_compute_instance" "mynet-us-vm" {
  name         = "mynet-us-vm"
  machine_type = "f1-micro"
  zone         = "us-central1-c"

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }

  }

  network_interface {
    network = google_compute_network.mynetwork.name
    access_config {
      # allow public ip
    }
  }

  depends_on = [
    google_compute_network.mynetwork,
    google_compute_firewall.allow-icmp-ssh
  ]
}

resource "google_compute_instance" "mynet-eu-vm" {
  name         = "mynet-eu-vm"
  machine_type = "f1-micro"
  zone         = "europe-central2-a"

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = google_compute_network.mynetwork.name
    access_config {
      # allow public ip
    }
  }

  depends_on = [
    google_compute_network.mynetwork,
    google_compute_firewall.allow-icmp-ssh
  ]
}
