
output "network_name" {
  value       = google_compute_network.shared_vpc.name
  description = "Name of the shared VPC network"
}

output "subnet_a_self_link" {
  value       = google_compute_subnetwork.subnet_a.self_link
  description = "Self link of subnet A"
}

output "subnet_b_self_link" {
  value       = google_compute_subnetwork.subnet_b.self_link
  description = "Self link of subnet B"
}
