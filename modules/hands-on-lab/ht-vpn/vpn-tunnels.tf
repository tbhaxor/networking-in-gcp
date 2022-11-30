resource "google_compute_vpn_tunnel" "on-prem-tunnel1" {
  name                    = "on-prem-tunnel1"
  peer_ip                 = google_compute_address.cloud-gw1.address
  target_vpn_gateway      = google_compute_vpn_gateway.on-prem-gw1.name
  ike_version             = 2
  local_traffic_selector  = ["0.0.0.0/0"]
  remote_traffic_selector = ["0.0.0.0/0"]
  shared_secret           = var.tunnel_secret
  region                  = "us-central1"

  depends_on = [
    google_compute_address.cloud-gw1,
    google_compute_vpn_gateway.on-prem-gw1,
    google_compute_forwarding_rule.on-prem-fr-esp,
    google_compute_forwarding_rule.on-prem-fr-udp500,
    google_compute_forwarding_rule.on-prem-fr-udp4500
  ]
}


resource "google_compute_vpn_tunnel" "cloud-tunnel1" {
  name                    = "cloud-tunnel1"
  peer_ip                 = google_compute_address.on-prem-gw1.address
  target_vpn_gateway      = google_compute_vpn_gateway.cloud-gw1.name
  ike_version             = 2
  local_traffic_selector  = ["0.0.0.0/0"]
  remote_traffic_selector = ["0.0.0.0/0"]
  shared_secret           = var.tunnel_secret
  region                  = "us-east1"

  depends_on = [
    google_compute_address.on-prem-gw1,
    google_compute_vpn_gateway.on-prem-gw1,
    google_compute_forwarding_rule.cloud-1-fr-esp,
    google_compute_forwarding_rule.cloud-1-fr-udp500,
    google_compute_forwarding_rule.cloud-1-fr-udp4500
  ]
}
