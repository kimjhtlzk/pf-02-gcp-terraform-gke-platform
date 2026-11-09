resource "google_service_account" "service_account" {
  account_id   = var.id
  display_name = var.name == null ? var.id : var.name
  description  = var.description
}
