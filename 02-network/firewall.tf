resource "google_compute_firewall" "gke_ingress" {
  project   = var.project
  name      = "${google_compute_network.vpc.name}-ingress"
  network   = google_compute_network.vpc.name
  direction = "INGRESS"
  priority  = "100"

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["159.146.13.32", "212.146.63.50"]
  target_tags   = ["ingress"]
}
