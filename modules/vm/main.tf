resource "google_compute_instance" "vm" {
  name         = var.vm_name
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type
  
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }
  
  network_interface {
    subnetwork = var.subnet_self_link
    access_config {}  # Assign ephemeral external IP
  }
  
  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
  
  tags = ["http-server"]
  
  metadata_startup_script = <<-EOT
    #!/bin/bash
    set -eux
    export DEBIAN_FRONTEND=noninteractive
    
    # Wait briefly for network/DNS (max ~30s)
    for i in $(seq 1 10); do
      if ping -c1 deb.debian.org >/dev/null 2>&1; then
        break
      fi
      sleep 3
    done
    
    # Install & start Apache (idempotent)
    apt-get update -y || true
    apt-get install -y apache2 || true
    systemctl enable apache2
    systemctl restart apache2
    
    # Sample page
    cat > /var/www/html/index.html <<EOF
    <!doctype html>
    <html>
      <head><title>Lumen Migration Factory</title></head>
      <body style="font-family:sans-serif">
        <h1>Hello from lumenmigrationfactory.com!</h1>
        <p>Server: ${var.vm_name}</p>
      </body>
    </html>
EOF
    
    chown root:root /var/www/html/index.html
    chmod 0644 /var/www/html/index.html
  EOT
}
