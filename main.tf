module "vpc" {
source = "./modules/vpc"
network_name = var.network_name
}


module "iam" {
source = "./modules/iam"
}


module "vm" {
source = "./modules/vm"
zone = var.zone
network_selflink = module.vpc.network_selflink
subnet_selflink = module.vpc.subnet1_selflink
service_account = module.iam.service_account_email


depends_on = [module.vpc, module.iam]
}


module "dns" {
source = "./modules/dns"
vm_public_ip = module.vm.public_ip


depends_on = [module.dns, module.vm]
}
