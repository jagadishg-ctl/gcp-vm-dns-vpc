terraform {
backend "gcs" {
bucket = "migration_gcs"
prefix = "terraform/state/shared-vpc"
impersonate_service_account = "galaxy@terraform-project-475116.iam.gserviceaccount.com"
}
}
