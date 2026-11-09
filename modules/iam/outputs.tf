output "iam_roles" {
  description = "Iam roles."
  value = {
    (var.email) = [for role in google_project_iam_member.binding_roles : split("/", role.role)[length(split("/", role.role)) - 1]]
  }
}
