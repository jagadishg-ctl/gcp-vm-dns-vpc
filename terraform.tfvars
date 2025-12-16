
# Project & location
project_id = "terraform-project-475116"
region     = "asia-south1"
zone       = "asia-south1-a"

# Impersonation SA (the caller must have roles/iam.serviceAccountTokenCreator on this)
impersonate_service_account = "galaxy@terraform-project-475116.iam.gserviceaccount.com"

# Shared VPC & Subnets (/22)
network_name  = "shared-vpc"
subnet_a_name = "subnet-a"
subnet_a_cidr = "10.20.0.0/22"
subnet_b_name = "subnet-b"
subnet_b_cidr = "10.20.4.0/22"

# IAM
service_account_id           = "galaxy"
service_account_display_name = "Galaxy VM Service Account"

# VM
vm_name      = "migrationgcp-web-vm"
machine_type = "e2-micro"



