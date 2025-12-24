
terraform {
  backend "gcs" {
    bucket = "migration_gcs"
    prefix = "state/gcp-infrastructure"
  }
}
