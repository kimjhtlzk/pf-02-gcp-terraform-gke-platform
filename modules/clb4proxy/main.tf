resource "google_compute_global_forwarding_rule" "fd_rule" {
  name                  = var.forwarding_rule.rule_name
  ip_protocol           = var.forwarding_rule.ip_protocol
  load_balancing_scheme = var.forwarding_rule.load_balancing_scheme
  port_range            = var.forwarding_rule.port_range
  ip_address            = var.forwarding_rule.public_ip == "auto" ? google_compute_global_address.pip[0].address : data.google_compute_global_address.pip[0].address
  target                = var.proxy_rule == "tcp" ? google_compute_target_tcp_proxy.tcp_proxy[0].id : google_compute_target_ssl_proxy.ssl_proxy[0].id
}

resource "google_compute_global_address" "pip" {
  count = var.forwarding_rule.public_ip == "auto" ? 1 : 0

  name         = "lb-${var.name}-pip"
  address_type = "EXTERNAL"
  ip_version   = "IPV4"
}

data "google_compute_global_address" "pip" {
  count = var.forwarding_rule.public_ip != "auto" ? 1 : 0

  name = var.forwarding_rule.public_ip
}

resource "google_compute_target_ssl_proxy" "ssl_proxy" {
  count = var.proxy_rule == "ssl" ? 1 : 0

  name             = var.proxy_name
  backend_service  = google_compute_backend_service.backend.id
  ssl_certificates = [google_compute_ssl_certificate.ssl_certificate[0].id]

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "google_compute_ssl_certificate" "ssl_certificate" {
  count = var.proxy_rule == "ssl" ? 1 : 0

  name_prefix = var.ssl_certificate.sslkey_name
  private_key = var.ssl_certificate.private_key
  certificate = var.ssl_certificate.certificate

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "google_compute_target_tcp_proxy" "tcp_proxy" {
  count = var.proxy_rule == "tcp" ? 1 : 0

  name            = var.proxy_name
  backend_service = google_compute_backend_service.backend.id

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "google_compute_backend_service" "backend" {
  name                            = var.backend_name
  port_name                       = "tcp-${var.backend_port}"
  protocol                        = "TCP"
  timeout_sec                     = var.timeout_sec
  affinity_cookie_ttl_sec         = "0"
  enable_cdn                      = "false"
  health_checks                   = [google_compute_health_check.default.id]
  load_balancing_scheme           = var.load_balancing_scheme
  session_affinity                = var.session_affinity
  connection_draining_timeout_sec = var.connection_draining_timeout_sec

  backend {
    group                        = var.group
    balancing_mode               = var.backend_pool.balancing_mode
    capacity_scaler              = var.backend_pool.capacity_scaler
    max_connections              = "0"
    max_connections_per_endpoint = "0"
    max_connections_per_instance = "0"
    max_rate                     = "0"
    max_rate_per_endpoint        = "0"
    max_rate_per_instance        = "0"
    max_utilization              = var.backend_pool.max_utilization
  }

  timeouts {}

}

resource "google_compute_health_check" "default" {
  name                = var.health_checks.health_checksname
  check_interval_sec  = var.health_checks.check_interval_sec
  timeout_sec         = var.health_checks.timeout_sec
  healthy_threshold   = var.health_checks.healthy_threshold
  unhealthy_threshold = var.health_checks.unhealthy_threshold

  log_config {
    enable = var.health_checks.log_config_enable
  }

  tcp_health_check {
    port = var.health_checks.health_check_port
  }

  timeouts {}

}
