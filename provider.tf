terraform {
required_version = ">= 1.6.0"
required_providers {
google = {
source = "hashicorp/google"
version = "~> 5.0"
}
}
}


provider "google" {
project = "terraform-project-475116"
region = "us-central1"
impersonate_service_account = "galaxy@terraform-project-475116.iam.gserviceaccount.com"
}
