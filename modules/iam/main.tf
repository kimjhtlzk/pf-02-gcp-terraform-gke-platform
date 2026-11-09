resource "google_project_iam_member" "binding_roles" {
  for_each = { for name, role in var.binding_roles : role => role }

  project = var.project
  role    = contains(keys(var.custom_role_ids), each.value) ? var.custom_role_ids[each.value] : "roles/${each.value}"
  member  = var.email

  depends_on = [var.depends_on_list]
}
