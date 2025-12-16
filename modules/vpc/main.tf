
resource "google_compute_network" "shared_vpc" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = false
  routing_mode            = "GLOBAL"
}

resource "google_compute_subnetwork" "subnet_a" {
  name          = var.subnet_a_name
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.shared_vpc.id
  ip_cidr_range = var.subnet_a_cidr
}

resource "google_compute_subnetwork" "subnet_b" {
  name          = var.subnet_b_name
  project       = var.project_id
  region        = var.region
  network       = google_compute_network.shared_vpc.id
  ip_cidr_range = var.subnet_b_cidr
}

resource "google_compute_firewall" "allow_all" {
  name    = "allow-all"
  project = var.project_id
  network = google_compute_network.shared_vpc.name

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]  # Allow from any IP
}







