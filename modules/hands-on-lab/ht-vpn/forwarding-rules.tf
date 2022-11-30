resource "google_compute_forwarding_rule" "cloud-1-fr-esp" {
  name        = "cloud-1-fr-esp"
  ip_protocol = "esp"
  ip_address  = google_compute_address.cloud-gw1.address
  target      = google_compute_vpn_gateway.cloud-gw1.id
  region      = "us-east1"

  depends_on = [
    google_compute_address.cloud-gw1,
    google_compute_vpn_gateway.cloud-gw1
  ]
}

resource "google_compute_forwarding_rule" "cloud-1-fr-udp500" {
  name        = "cloud-1-fr-udp500"
  ip_protocol = "udp"
  port_range  = "500"
  ip_address  = google_compute_address.cloud-gw1.address
  target      = google_compute_vpn_gateway.cloud-gw1.id
  region      = "us-east1"

  depends_on = [
    google_compute_address.cloud-gw1,
    google_compute_vpn_gateway.cloud-gw1
  ]
}


resource "google_compute_forwarding_rule" "cloud-1-fr-udp4500" {
  name        = "cloud-1-fr-udp4500"
  ip_protocol = "udp"
  port_range  = "4500"
  ip_address  = google_compute_address.cloud-gw1.address
  target      = google_compute_vpn_gateway.cloud-gw1.id
  region      = "us-east1"

  depends_on = [
    google_compute_address.cloud-gw1,
    google_compute_vpn_gateway.cloud-gw1
  ]
}


resource "google_compute_forwarding_rule" "on-prem-fr-esp" {
  name        = "on-prem-fr-esp"
  ip_protocol = "esp"
  ip_address  = google_compute_address.on-prem-gw1.address
  target      = google_compute_vpn_gateway.on-prem-gw1.id
  region      = "us-central1"

  depends_on = [
    google_compute_address.on-prem-gw1,
    google_compute_vpn_gateway.on-prem-gw1
  ]
}

resource "google_compute_forwarding_rule" "on-prem-fr-udp500" {
  name        = "on-prem-fr-udp500"
  ip_protocol = "udp"
  port_range  = "500"
  ip_address  = google_compute_address.on-prem-gw1.address
  target      = google_compute_vpn_gateway.on-prem-gw1.id
  region      = "us-central1"

  depends_on = [
    google_compute_address.on-prem-gw1,
    google_compute_vpn_gateway.on-prem-gw1
  ]
}


resource "google_compute_forwarding_rule" "on-prem-fr-udp4500" {
  name        = "on-prem-fr-udp4500"
  ip_protocol = "udp"
  port_range  = "4500"
  ip_address  = google_compute_address.on-prem-gw1.address
  target      = google_compute_vpn_gateway.on-prem-gw1.id
  region      = "us-central1"

  depends_on = [
    google_compute_address.on-prem-gw1,
    google_compute_vpn_gateway.on-prem-gw1
  ]
}
