
variable "project_id" {
  type = string
}

# Existing SA ID (NOT email). Example: galaxy
variable "service_account_id" {
  type        = string
  description = "Existing service account ID (the part before @). Example: galaxy"
}

# Optional (unused when reusing an existing SA)
variable "service_account_display_name" {
  type        = string
  description = "Display name (unused when reusing an existing SA)"
  default     = null
}

