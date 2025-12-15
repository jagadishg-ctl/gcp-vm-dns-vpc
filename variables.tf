
variable "project_id" { type = string }variable
variable "region"     { type = string }
variable "zone"       { type = string }

variable "impersonate_service_account" { type = string }

# VPC
variable "network_name"   { type = string }
variable "subnet_a_name"  { type = string }
variable "subnet_a_cidr"  { type = string }
variable "subnet_b_name"  { type = string }
variable "subnet_b_cidr"  { type = string }

# IAM
variable "service_account_id"           { type = string }
variable "service_account_display_name" { type = string }

# VM
variable "vm_name"      { type = string }
