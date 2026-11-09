resource "google_compute_instance_group" "default" {
  for_each  = var.groups
  name      = each.key
  zone      = each.value.zone
  network   = each.value.network
  instances = [for i in each.value.instances : i]

  dynamic "named_port" {
    for_each = [for named in each.value.named_ports : named]
    iterator = named
    content {
      name = "${named.value.protocol}-${named.value.port}"
      port = named.value.port
    }
  }

  timeouts {
    update = "30m"
  }

  depends_on = [var.depends_on_list]
}

resource "google_compute_health_check" "default" {
  for_each = var.health
  name     = each.key

  check_interval_sec  = each.value.check_interval_sec
  timeout_sec         = each.value.timeout_sec
  healthy_threshold   = each.value.healthy_threshold
  unhealthy_threshold = each.value.unhealthy_threshold

  dynamic "http_health_check" {
    for_each = [for check in each.value.check : check if each.value.protocol == "http"]
    iterator = check
    content {
      port         = check.value.port
      request_path = check.value.path
      proxy_header = check.value.header
    }
  }

  dynamic "http2_health_check" {
    for_each = [for check in each.value.check : check if each.value.protocol == "http2"]
    iterator = check
    content {
      port         = check.value.port
      request_path = check.value.path
      proxy_header = check.value.header
    }
  }

  dynamic "https_health_check" {
    for_each = [for check in each.value.check : check if each.value.protocol == "https"]
    iterator = check
    content {
      port         = check.value.port
      request_path = check.value.path
      proxy_header = check.value.header
    }
  }

  dynamic "tcp_health_check" {
    for_each = [for check in each.value.check : check if each.value.protocol == "tcp"]
    iterator = check
    content {
      port         = check.value.port
      proxy_header = check.value.header
    }
  }

  dynamic "ssl_health_check" {
    for_each = [for check in each.value.check : check if each.value.protocol == "ssl"]
    iterator = check
    content {
      port         = check.value.port
      proxy_header = check.value.header
    }
  }

  depends_on = [google_compute_instance_group.default]
}

resource "google_compute_ssl_certificate" "default" {
  for_each    = { for i in var.ssl : i.sslkey_name => i }
  name_prefix = each.value.sslkey_name
  private_key = each.value.private_key
  certificate = each.value.certificate

  lifecycle {
    create_before_destroy = "true"
  }

  depends_on = [google_compute_instance_group.default]
}
