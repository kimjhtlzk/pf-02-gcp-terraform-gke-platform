output "ip_address" {
  description = "Ip address."
  value       = join("", google_compute_global_address.global[*].address, google_compute_address.regional[*].address)
}

output "type" {
  description = "Type."
  value       = var.type
}

output "name" {
  description = "Name."
  value       = var.name
}
