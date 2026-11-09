output "account_id" {
  description = "Account id."
  value       = google_service_account.service_account.account_id
}

output "email" {
  description = "Email."
  value       = google_service_account.service_account.email
}
