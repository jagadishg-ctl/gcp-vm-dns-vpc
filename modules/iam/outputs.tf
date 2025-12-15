
output "service_account_email" {
  value       = google_service_account.vm_sa.email
  description = "Email of the VM service account"
}
