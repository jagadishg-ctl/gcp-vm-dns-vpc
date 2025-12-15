
# Read existing SA (no create)
data "google_service_account" "vm_sa" {
  project    = var.project_id
  account_id = var.service_account_id  # e.g., "galaxy"
}

# (Optional) Keep role bindings only if you want Terraform to ensure these roles exist.
# If roles are already present or you prefer not to manage them via TF, you can delete these blocks.

resource "google_project_iam_member" "log_writer" {
  project = var.project_id
  role    = "roles/logging.logWriter"
  member  = "serviceAccount:${data.google_service_account.vm_sa.email}"
}

resource "google_project_iam_member" "metric_writer" {
  project = var.project_id
  role    = "roles/monitoring.metricWriter"
  member  = "serviceAccount:${data.google_service_account.vm_sa.email}"
}

