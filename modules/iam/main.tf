resource "google_service_account" "vm_sa" {
account_id = "vm-web-sa"
display_name = "VM Web Service Account"
}


resource "google_project_iam_member" "compute_admin" {
role = "roles/compute.admin"
member = "serviceAccount:${google_service_account.vm_sa.email}"
}
