output "network" {
  value = google_compute_network.vpc.name
}
output "node_network" {
  value = google_compute_subnetwork.subnet.name
}
output "pod_network" {
  value = google_compute_subnetwork.subnet.secondary_ip_range[0].range_name
}
output "service_network" {
  value = google_compute_subnetwork.subnet.secondary_ip_range[1].range_name
}
