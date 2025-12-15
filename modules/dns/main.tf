resource "google_dns_managed_zone" "public_zone" {
name = "lumenmigrationfactory-com"
dns_name = "lumenmigrationfactory.com."
visibility = "public"
}


resource "google_dns_record_set" "vm_a_record" {
name = "www.lumenmigrationfactory.com."
managed_zone = google_dns_managed_zone.public_zone.name
type = "A"
ttl = 300
rrdatas = [var.vm_public_ip]
}
