resource "google_compute_disk" "primary_disk" {
  #checkov:skip=CKV_GCP_37:Google-managed encryption is the default. A customer-supplied key would add a key lifecycle this reference does not own.
  name = var.primary_disk_name
  zone = var.primary_zone
  type = var.primary_type
  size = var.primary_size
}

resource "google_compute_disk" "secondary_disk" {
  #checkov:skip=CKV_GCP_37:Google-managed encryption is the default. A customer-supplied key would add a key lifecycle this reference does not own.
  name = var.secondary_disk_name
  zone = var.secondary_zone
  type = var.primary_type

  async_primary_disk {
    disk = google_compute_disk.primary_disk.id
  }
}

resource "google_compute_disk_async_replication" "replication" {
  count = var.sync_start == "yes" ? 1 : 0

  primary_disk = google_compute_disk.primary_disk.id
  secondary_disk {
    disk = google_compute_disk.secondary_disk.id
  }
}
