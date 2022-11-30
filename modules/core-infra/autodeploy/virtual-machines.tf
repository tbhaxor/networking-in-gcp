locals {
  machines = [
    {
      name = "mynet-us-vm"
      type = "e2-micro"
      zone = "us-central1-a"
    },
    {
      name = "mynet-eu-vm",
      type = "e2-micro",
      zone = "europe-west1-d"
    }
  ]
}
resource "google_compute_instance" "instance" {
  for_each = {
    for index, vm in local.machines :
    vm.name => vm
  }

  name         = each.value.name
  zone         = each.value.zone
  machine_type = each.value.type

  boot_disk {
    auto_delete = true
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  network_interface {
    network = google_compute_network.mynetwork.name
    access_config {
      # Allocate a one-to-one NAT IP to the instance
    }
  }
}
