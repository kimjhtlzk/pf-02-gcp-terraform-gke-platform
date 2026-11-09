resource "google_compute_backend_service" "backendservice" {
  name                            = "${var.name}-backend-service"
  port_name                       = "${lower(var.backend_protocol)}-${var.backend_port}"
  protocol                        = var.backend_protocol
  timeout_sec                     = var.timeout_sec
  affinity_cookie_ttl_sec         = "0"
  enable_cdn                      = "false"
  health_checks                   = [google_compute_health_check.helthcheck.self_link]
  load_balancing_scheme           = var.load_balancing_scheme
  session_affinity                = var.session_affinity
  connection_draining_timeout_sec = var.connection_draining_timeout_sec
  locality_lb_policy              = var.locality_lb_policy

  backend {
    group                        = var.group
    balancing_mode               = var.backend.balancing_mode
    capacity_scaler              = var.backend.capacity_scaler
    max_connections              = "0"
    max_connections_per_endpoint = "0"
    max_connections_per_instance = "0"
    max_rate                     = "0"
    max_rate_per_endpoint        = "0"
    max_rate_per_instance        = var.backend.max_rate_per_instance
    max_utilization              = var.backend.max_utilization
  }

  log_config {
    enable      = var.log_config_enable
    sample_rate = var.log_config_sample_rate
  }

  dynamic "consistent_hash" {
    for_each = var.session_affinity == "HTTP_COOKIE" ? [1] : []
    content {
      minimum_ring_size = var.consistent_hash.minimum_ring_size
      http_cookie {
        ttl {
          seconds = 0
          nanos   = 0
        }
        name = var.consistent_hash.cookie_name
      }
    }
  }
}

resource "google_compute_health_check" "helthcheck" {
  name                = "${var.name}-health-check"
  check_interval_sec  = var.health_checks.check_interval_sec
  healthy_threshold   = var.health_checks.healthy_threshold
  timeout_sec         = var.health_checks.timeout_sec
  unhealthy_threshold = var.health_checks.unhealthy_threshold

  log_config {
    enable = var.health_checks.log_config_enable
  }

  dynamic "tcp_health_check" {
    for_each = var.health_checks.health_check_protocol == "TCP" ? [1] : []
    content {
      port = var.health_checks.health_check_port
    }
  }
  dynamic "http_health_check" {
    for_each = var.health_checks.health_check_protocol == "HTTP" ? [1] : []
    content {
      port         = var.health_checks.health_check_port
      request_path = var.health_checks.health_check_request_path
    }
  }
  dynamic "https_health_check" {
    for_each = var.health_checks.health_check_protocol == "HTTPS" ? [1] : []
    content {
      port         = var.health_checks.health_check_port
      request_path = var.health_checks.health_check_request_path
    }
  }
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

resource "google_compute_global_forwarding_rule" "frontend_forwarding_rule" {
  ip_address            = var.forwarding_rule.public_ip == "auto" ? google_compute_global_address.pip[0].address : data.google_compute_global_address.pip[0].address
  name                  = "${var.name}-fd-rules"
  ip_protocol           = var.forwarding_rule.ip_protocol
  load_balancing_scheme = var.forwarding_rule.load_balancing_scheme
  port_range            = var.forwarding_rule.port_range
  target                = var.forwarding_rule.port_range == "443" ? google_compute_target_https_proxy.target_proxy_https[0].self_link : google_compute_target_http_proxy.target_proxy_http[0].self_link
}

resource "google_compute_ssl_certificate" "ssl_certificate" {
  name_prefix = var.ssl_certificate.sslkey_name
  private_key = var.ssl_certificate.private_key
  certificate = var.ssl_certificate.certificate

  lifecycle {
    create_before_destroy = "true"
  }
}

resource "google_compute_target_https_proxy" "target_proxy_https" {
  count = var.forwarding_rule.port_range == "443" ? 1 : 0

  name             = "${var.name}-target-https-proxy"
  proxy_bind       = var.target_proxy.proxy_bind
  quic_override    = "NONE"
  ssl_certificates = [google_compute_ssl_certificate.ssl_certificate.self_link]
  url_map          = google_compute_url_map.url_map.self_link
}

resource "google_compute_target_http_proxy" "target_proxy_http" {
  count = var.forwarding_rule.port_range == "80" ? 1 : 0

  name       = "${var.name}-target-https-proxy"
  proxy_bind = var.target_proxy.proxy_bind
  url_map    = google_compute_url_map.url_map.self_link
}

resource "google_compute_url_map" "url_map" {
  name            = "${var.name}-${var.backend_port}"
  default_service = google_compute_backend_service.backendservice.self_link

  lifecycle {
    create_before_destroy = "true"
  }
}
