resource "google_compute_region_backend_service" "backend_service" {
  name                            = var.name
  region                          = var.region
  protocol                        = var.protocol
  load_balancing_scheme           = var.load_balancing_scheme
  session_affinity                = var.session_affinity
  timeout_sec                     = var.timeout_sec
  affinity_cookie_ttl_sec         = "0"
  connection_draining_timeout_sec = var.connection_draining_timeout_sec
  locality_lb_policy              = var.load_balancing_scheme == "INTERNAL" ? null : var.locality_lb_policy
  enable_cdn                      = "false"

  log_config {
    enable      = var.log_config_enable
    sample_rate = var.log_config_sample_rate
  }

  dynamic "backend" {
    for_each = var.backend
    content {
      group                        = backend.value.group
      balancing_mode               = backend.value.balancing_mode
      capacity_scaler              = backend.value.capacity_scaler
      failover                     = backend.value.failover
      max_connections              = "0"
      max_connections_per_instance = "0"
      max_connections_per_endpoint = "0"
      max_rate                     = "0"
      max_rate_per_instance        = "0"
      max_rate_per_endpoint        = "0"
      max_utilization              = "0"
    }
  }

  health_checks = [
    google_compute_region_health_check.backend_health_check.self_link
  ]
}

resource "google_compute_region_health_check" "backend_health_check" {
  name                = "${var.name}-health-check"
  region              = var.region
  check_interval_sec  = var.health_checks.check_interval_sec
  healthy_threshold   = var.health_checks.healthy_threshold
  timeout_sec         = var.health_checks.timeout_sec
  unhealthy_threshold = var.health_checks.unhealthy_threshold

  dynamic "tcp_health_check" {
    for_each = var.health_checks.health_check_protocol == "TCP" ? [1] : []
    content {
      port         = var.health_checks.health_check_port
      proxy_header = var.health_checks.health_check_proxy_header
    }
  }

  dynamic "http_health_check" {
    for_each = var.health_checks.health_check_protocol == "HTTP" ? [1] : []
    content {
      port         = var.health_checks.health_check_port
      request_path = var.health_checks.health_check_request_path
      proxy_header = var.health_checks.health_check_proxy_header
    }
  }

  dynamic "https_health_check" {
    for_each = var.health_checks.health_check_protocol == "HTTPS" ? [1] : []
    content {
      port         = var.health_checks.health_check_port
      request_path = var.health_checks.health_check_request_path
      proxy_header = var.health_checks.health_check_proxy_header
    }
  }

}

resource "google_compute_address" "pip" {
  count = var.load_balancing_scheme == "EXTERNAL" && var.frontend_ip == "auto" ? 1 : 0

  name          = var.load_balancing_scheme == "INTERNAL" ? "lb-${var.name}-ip" : "lb-${var.name}-pip"
  region        = var.region
  address_type  = var.load_balancing_scheme
  prefix_length = "0"
  subnetwork    = var.load_balancing_scheme == "INTERNAL" ? var.subnetwork : null
  address       = var.load_balancing_scheme == "INTERNAL" ? var.ip_address : null
}

data "google_compute_address" "pip" {
  count = var.frontend_ip != "auto" || var.shared_ip == "true" ? 1 : 0

  name   = var.shared_ip == "true" ? var.ip_address : var.frontend_ip
  region = var.region
}

resource "google_compute_forwarding_rule" "forwarding_rule" {
  name                   = "${var.name}-fd-rules"
  region                 = var.region
  ip_protocol            = var.forwarding_rule.ip_protocol
  load_balancing_scheme  = var.load_balancing_scheme
  network_tier           = "PREMIUM"
  ports                  = var.forwarding_rule.ports
  all_ports              = "false"
  allow_global_access    = var.forwarding_rule.allow_global_access
  is_mirroring_collector = "false"

  backend_service = google_compute_region_backend_service.backend_service.self_link

  network    = var.load_balancing_scheme == "INTERNAL" ? var.network : null
  subnetwork = var.load_balancing_scheme == "INTERNAL" ? var.subnetwork : null
  ip_address = (var.frontend_ip == "auto" && var.load_balancing_scheme == "EXTERNAL") ? google_compute_address.pip[0].address : data.google_compute_address.pip[0].address

}
