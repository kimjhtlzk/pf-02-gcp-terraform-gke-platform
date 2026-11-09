resource "google_artifact_registry_repository" "artifact_registry" {
  #checkov:skip=CKV_GCP_84:Google-managed encryption is the default. A customer key adds a key lifecycle this reference does not own.
  repository_id = var.artifact_registry_name
  location      = var.location
  format        = var.format

  dynamic "cleanup_policies" {
    for_each = var.cleanup_policies
    content {
      id     = cleanup_policies.value.id
      action = cleanup_policies.value.action

      dynamic "condition" {
        for_each = cleanup_policies.value.condition == null ? [] : [1]
        content {
          tag_state             = try(cleanup_policies.value.condition.tag_state, null)
          tag_prefixes          = try(cleanup_policies.value.condition.tag_prefixes, null)
          older_than            = try(cleanup_policies.value.condition.older_than, null)
          newer_than            = try(cleanup_policies.value.condition.newer_than, null)
          version_name_prefixes = try(cleanup_policies.value.condition.version_name_prefixes, null)
          package_name_prefixes = try(cleanup_policies.value.condition.package_name_prefixes, null)
        }
      }

      dynamic "most_recent_versions" {
        for_each = cleanup_policies.value.most_recent_versions == null ? [] : [1]
        content {
          keep_count            = try(cleanup_policies.value.most_recent_versions.keep_count, null)
          package_name_prefixes = try(cleanup_policies.value.most_recent_versions.package_name_prefixes, null)
        }
      }
    }
  }
}
