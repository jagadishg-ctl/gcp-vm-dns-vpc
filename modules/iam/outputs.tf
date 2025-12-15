
output "service_account_email" {
  value       = data.google_service_account.vm_sa.email
  description = "Email of the existing VM service account"
}


