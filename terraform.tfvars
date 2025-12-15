
project_id = "terraform-project-475116"
region     = "asia-south1"
zone       = "asia-south1-azone       = "asia-south1-a"

impersonate_service_account = "galaxy@terraform-project-475116.iam.gserviceaccount.com"

network_name  = "shared-vpc"
subnet_a_name = "subnet-a"
subnet_a_cidr = "10.20.0.0/22"
subnet_b_name = "subnet-b"
subnet_b_cidr = "10.20.4.0/22"

service_account_id           = "galaxy"
service_account_display_name = "Galaxy VM Service Account"

vm_name      = "sample-web-vm"
