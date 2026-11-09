resource "google_compute_network" "vpc" {
  #checkov:skip=CKV2_GCP_18:Firewall rules live in the firewall and c2sfirewall modules, attached to this network by the caller.
  name                    = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  routing_mode            = var.routing_mode
  description             = var.description
  depends_on              = [var.depends_on_list]
}

resource "google_compute_subnetwork" "subnet" {
  for_each = { for subnet in var.subnets : subnet.subnet_name => subnet }

  name                     = each.value.subnet_name
  ip_cidr_range            = each.value.subnet_ip
  region                   = each.value.subnet_region
  network                  = google_compute_network.vpc.name
  private_ip_google_access = true

  dynamic "log_config" {
    for_each = each.value.log_config_enabled ? [1] : []
    content {
      aggregation_interval = "INTERVAL_10_MIN"
      flow_sampling        = 0.2
      metadata             = "INCLUDE_ALL_METADATA"
    }
  }

  dynamic "secondary_ip_range" {
    for_each = each.value.secondary_ip
    iterator = ip_range

    content {
      range_name    = ip_range.value.name
      ip_cidr_range = ip_range.value.ip_cidr_range
    }
  }

}
