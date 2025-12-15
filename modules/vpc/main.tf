
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

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  project = var.project_id
  network = google_compute_network.shared_vpc  network = google_compute_network.shared_vpc.name

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]

