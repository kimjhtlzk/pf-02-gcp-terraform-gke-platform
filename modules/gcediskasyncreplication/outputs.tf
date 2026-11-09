output "primary_disk_id" {
  description = "Primary disk id."
  value       = google_compute_disk.primary_disk.id
}

output "secondary_disk_id" {
  description = "Secondary disk id."
  value       = google_compute_disk.secondary_disk.id
}
