
resource "google_dns_managed_zone" "public_zone" {
  name        = var.managed_zone_name
  project     = var.project_id
  dns_name    = var.dns_name
  visibility  = "public"
  description = "DNS zone for domain: lumenmigrationfactory.com"
  
  dnssec_config {
    state = "on"
    
    default_key_specs {
      algorithm  = "rsasha256"
      key_length = 2048
      key_type   = "keySigning"
    }
    
    default_key_specs {
      algorithm  = "rsasha256"
      key_length = 1024
      key_type   = "zoneSigning"
    }
  }
  
  lifecycle {
    prevent_destroy = false
  }
}

resource "google_dns_record_set" "root_a" {
  name         = var.dns_name            # "lumenmigrationfactory.com."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.public_zone.name
  rrdatas      = [var.vm_public_ip]
}

resource "google_dns_record_set" "www_cname" {
  name         = "www.${var.dns_name}"   # "www.lumenmigrationfactory.com."
  type         = "CNAME"
  ttl          = 300
  managed_zone = google_dns_managed_zone.public_zone.name
  rrdatas      = [var.dns_name]
}  
