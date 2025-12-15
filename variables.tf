
# Project & location
variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "zone" {
   type = string
}

# Impersonation SA
variable "impersonate_service_account" {
  type = string
}

# VPC & Subnets
variable "network_name" {
  type = string
}

variable "subnet_a_name" {
  type = string
}

variable "subnet_a_cidr" {
  type = string
}

variable "subnet_b_name" {
  type = string
}

variable "subnet_b_cidr" {
  type = string
}

# IAM / Service Account
variable "service_account_id" {
  type = string
}

variable "service_account_display_name" {
  type = string
}

# VM
variable "vm_name" {
  type = string
}

variable "machine_type" {
  type = string

