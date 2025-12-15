output "network_selflink" {
value = google_compute_network.shared_vpc.self_link
}


output "subnet1_selflink" {
value = google_compute_subnetwork.subnet1.self_link
}
