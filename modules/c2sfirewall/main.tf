locals {
  firewall_rules = {
    c2s-inbound-vpn = {
      direction            = "INGRESS"
      action               = "allow"
      ranges               = var.vpn_source_ranges
      sources              = null
      targets              = null
      use_service_accounts = false
      enable_logging       = false
      priority             = "1000"
      rules = [
        {
          protocol = "tcp"
          ports    = var.management_ports
        }
      ]
    }
    c2s-outbound-deny = {
      direction            = "EGRESS"
      action               = "deny"
      ranges               = ["0.0.0.0/0"]
      sources              = null
      targets              = null
      use_service_accounts = false
      enable_logging       = false
      priority             = "65534"
      rules = [
        {
          protocol = "tcp"
          ports    = ["0-65535"]
        },
        {
          protocol = "udp"
          ports    = ["0-65535"]
        }
      ]
    }
  }
}

resource "google_compute_firewall" "rules" {
  for_each = local.firewall_rules

  network                 = var.network
  name                    = lower("${split("/", var.network)[length(split("/", var.network)) - 1]}-${each.key}")
  direction               = each.value.direction
  source_ranges           = each.value.direction == "INGRESS" ? each.value.ranges : null
  destination_ranges      = each.value.direction == "EGRESS" ? each.value.ranges : null
  source_tags             = each.value.use_service_accounts || each.value.direction == "EGRESS" ? null : each.value.sources
  source_service_accounts = each.value.use_service_accounts && each.value.direction == "INGRESS" ? each.value.sources : null
  target_tags             = each.value.use_service_accounts ? null : each.value.targets
  target_service_accounts = each.value.use_service_accounts ? each.value.targets : null
  priority                = each.value.priority

  dynamic "log_config" {
    for_each = each.value.enable_logging ? [1] : []
    content {
      metadata = "INCLUDE_ALL_METADATA"
    }
  }

  dynamic "allow" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "allow"]
    iterator = rule

    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }

  dynamic "deny" {
    for_each = [for rule in each.value.rules : rule if each.value.action == "deny"]
    iterator = rule

    content {
      protocol = rule.value.protocol
      ports    = rule.value.ports
    }
  }
}
