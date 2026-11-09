resource "google_compute_address" "regional" {
  count = var.type == "regional" ? 1 : 0

  name   = var.name
  region = var.region
}

resource "google_compute_global_address" "global" {
  count = var.type == "global" ? 1 : 0

  name = var.name
}
