resource "google_dns_managed_zone" "private-zone" {
  #checkov:skip=CKV_GCP_16:DNSSEC applies to public zones. This zone is private.
  name     = var.cloud_dns_name
  dns_name = var.dns_name

  visibility = var.visibility

  private_visibility_config {
    networks {
      network_url = var.network
    }
  }

}
