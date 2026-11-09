resource "google_compute_network_peering" "peering" {
  name = var.peer_name

  network      = var.origin_network
  peer_network = var.destination_network

  export_custom_routes = true
  import_custom_routes = true

  export_subnet_routes_with_public_ip = true
  import_subnet_routes_with_public_ip = false

  stack_type = "IPV4_ONLY"
}
