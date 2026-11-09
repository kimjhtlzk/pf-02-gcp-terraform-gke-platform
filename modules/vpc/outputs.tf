output "network" {
  description = "Network."
  value       = google_compute_network.vpc
}

output "network_name" {
  description = "Network name."
  value       = google_compute_network.vpc.name
}

output "subnets" {
  description = "Subnets."
  value       = google_compute_subnetwork.subnet
}

output "self_link" {
  description = "Self link."
  value       = google_compute_network.vpc.self_link
}
