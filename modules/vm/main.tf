
resource "google_compute_instance" "vm" {
  name         = var.vm_name
  project      = var.project_id
  zone         = var.zone
  machine_type = var.machine_type
}
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    subnetwork   = var.subnet_self_link
    access_config {} # Assign external IP
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

    cat <<'HTML' > /var/www/html/index.html
    <!DOCTYPE html>
    <html lang="en">
    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>Cloud Migration Factory</title>
      <style>
        body {
          background: linear-gradient(135deg, #4facfe, #00f2fe);
          font-family: Arial, sans-serif;
          color: #fff;
          text-align: center;
          padding: 50px;
        }
        h1 {
          font-size: 3em;
          color: #ffeb3b;
          text-shadow: 2px 2px #000;
        }
        p        p {
          font-size: 1.5em;
          color: #f8f9fa;
        }
        .container {
          background: rgba(0, 0, 0, 0.3);
          padding: 30px;
          border-radius: 15px;
          display: inline-block;
        }
        .btn {
          background-color: #ff5722;
          color: white;
          padding: 15px 30px;
          font-size: 1.2em;
          border: none;
          border-radius: 8px;
          cursor: pointer;
          margin-top: 20px;
        }
        .btn:hover {
          background-color: #e64a19;
        }
      </style>
    </head>
    <body>
      <div class="container">
        <h1>Welcome to Cloud Migration Factory</h1>
        <p>Empowering seamless cloud transitions with vibrant solutions!</p>
        <button class="btn">Explore More</button>
      </div>
    </body>
    </html>
    HTML
  EOT


