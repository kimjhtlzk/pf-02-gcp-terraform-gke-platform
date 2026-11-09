resource "google_storage_bucket" "cloud_storage" {
  #checkov:skip=CKV_GCP_62:The access log bucket differs per environment and is set up outside this module.
  name                        = var.bucket_name
  location                    = var.location
  storage_class               = var.storage_class
  force_destroy               = var.force_destroy
  uniform_bucket_level_access = var.uniform_bucket_level_access
  public_access_prevention    = "enforced"

  versioning {
    enabled = var.versioning
  }

  dynamic "lifecycle_rule" {
    for_each = var.lifecycle_rule
    content {
      condition {
        age = lifecycle_rule.value.age
      }
      action {
        type          = lifecycle_rule.value.type
        storage_class = try(lifecycle_rule.value.storage_class_action, null)
      }
    }
  }

  soft_delete_policy {
    retention_duration_seconds = var.soft_delete_retention_seconds
  }

}

resource "google_storage_bucket_iam_member" "member" {
  for_each = var.storage_bucket_iam_member
  bucket   = google_storage_bucket.cloud_storage.name
  member   = each.value.member
  role     = each.value.role
}
