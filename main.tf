
resource "google_project_service" "compute" {
  project            = var.project_id
  service            = "compute.googleapis.com"
  disable_on_destroy = false
}

module "vpc" {
  source         = "./modules/vpc"
  project_id     = var.project_id
  region         = var.region
  network_name   = var.network  network_name   = var.network_name
  subnet_a_name  = var.subnet_a_name
  subnet_a_cidr  = var.subnet_a_cidr
  subnet_b_name  = var.subnet_b_name
  subnet_b_cidr  = var.subnet_b_cidr

  depends_on = [google_project_service.compute]
}

module "iam" {
  source                       = "./modules/iam"
  project_id                   = var.project_id
  service_account_id           = var.service_account_id
  service_account_display_name = var.service_account_display_name
}

module "vm" {
  source                = "./modules/vm"
  project_id            = var.project_id
  region                = var.region
  zone                  = var.zone
  vm_name               = var.vm_name
  machine_type          = var.machine_type
  subnet_self_link      = module.vpc.subnet_a_self_link
  service_account_email = module.iam.service_account_email

  depends_on = [module.vpc, google_project_service.compute]
