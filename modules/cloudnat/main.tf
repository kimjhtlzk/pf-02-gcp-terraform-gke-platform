resource "google_compute_router" "router" {
  name    = "${var.nat_name}-router"
  region  = var.region
  network = var.network
}

resource "google_compute_router_nat" "nat" {
  name   = var.nat_name
  router = google_compute_router.router.name
  region = google_compute_router.router.region

  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [google_compute_address.external.self_link]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  enable_dynamic_port_allocation      = true
  min_ports_per_vm                    = 1024
  max_ports_per_vm                    = 65536
  enable_endpoint_independent_mapping = false
  udp_idle_timeout_sec                = 30
  tcp_established_idle_timeout_sec    = 1200
  tcp_transitory_idle_timeout_sec     = 30
  icmp_idle_timeout_sec               = 30
  tcp_time_wait_timeout_sec           = 120
}

resource "google_compute_address" "external" {
  name         = "${var.nat_name}-external"
  region       = google_compute_router.router.region
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}
