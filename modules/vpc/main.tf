resource "google_compute_network" "shared_vpc" {
name = var.network_name
auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "subnet1" {
name = "subnet-a"
region = "us-central1"
ip_cidr_range = "10.10.0.0/22"
network = google_compute_network.shared_vpc.id
}


resource "google_compute_subnetwork" "subnet2" {
name = "subnet-b"
region = "us-central1"
ip_cidr_range = "10.20.0.0/22"
network = google_compute_network.shared_vpc.id
}
