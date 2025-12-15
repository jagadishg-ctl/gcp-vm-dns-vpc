resource "google_compute_instance" "web" {
name = "web-vm"
zone = var.zone
machine_type = "e2-medium"


boot_disk {
initialize_params {
image = "debian-cloud/debian-12"
}
}


network_interface {
network = var.network_selflink
subnetwork = var.subnet_selflink
access_config {}
}


service_account {
email = var.service_account
scopes = ["cloud-platform"]
}


metadata_startup_script = <<-EOF
#!/bin/bash
apt-get update
apt-get install -y apache2
echo "<h1>Lumen Migration Factory</h1>" > /var/www/html/index.html
systemctl restart apache2
EOF
}
