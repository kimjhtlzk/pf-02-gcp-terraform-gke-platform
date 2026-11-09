resource "google_redis_cluster" "cluster-ha" {
  name          = var.name
  region        = var.region
  shard_count   = var.shard_count
  replica_count = var.replica_count
  psc_configs {
    network = var.network
  }

  authorization_mode      = var.authorization_mode
  transit_encryption_mode = var.transit_encryption_mode

  lifecycle {
    prevent_destroy = true
  }

}
