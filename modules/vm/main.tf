
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
    access_config {}  # allocate ephemeral external IP
  }

  service_account {
    email  = var.service_account_email
    scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  tags = ["http-server"]

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y apache2
    systemctl enable apache2
    systemctl start apache2
    cat > /var/www/html/index.html <<'HTML'
    <!doctype html>
    <html>
      <head><title>Lumen Migration Factory</title></head>
      <body style="font-family:sans-serif">
        <h1>Hello from lumenmigrationfactory.com!</h1>
        <p>Server: ${var.vm_name}</p>
      </body>
    </html>
    HTML
  EOT
}

