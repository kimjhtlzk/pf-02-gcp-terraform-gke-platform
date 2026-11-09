resource "google_compute_resource_policy" "resource_policy" {
  name   = var.name
  region = var.region

  group_placement_policy {
    availability_domain_count = var.policy == "spread" ? 3 : null
    collocation               = var.policy == "compact" ? "COLLOCATED" : null
  }

}
