resource "google_redis_instance" "memorystore_redis" {
  name                    = var.name
  display_name            = var.name
  tier                    = var.tier
  location_id             = var.location_id
  alternative_location_id = var.tier != "BASIC" ? var.alternative_location_id : null
  redis_version           = var.redis_version
  memory_size_gb          = var.memory_size_gb

  read_replicas_mode = var.read_replicas_mode
  replica_count      = var.replica_count

  authorized_network = var.authorized_network
  reserved_ip_range  = var.reserved_ip_range

  connect_mode            = var.connect_mode
  auth_enabled            = var.auth_enabled
  transit_encryption_mode = var.transit_encryption_mode

  maintenance_policy {
    weekly_maintenance_window {
      day = var.maintenance_policy.day
      start_time {
        hours   = var.maintenance_policy.hours
        minutes = var.maintenance_policy.minutes
      }
    }
  }

  lifecycle {
    prevent_destroy = true
  }

}
