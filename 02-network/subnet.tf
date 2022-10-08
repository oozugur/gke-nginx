resource "google_compute_subnetwork" "subnet" {
  name                     = var.names.node
  ip_cidr_range            = var.subnets.node
  region                   = var.region
  network                  = google_compute_network.vpc.name
  private_ip_google_access = true
  depends_on               = [google_compute_network.vpc]
  secondary_ip_range = [
    {
      ip_cidr_range = var.subnets.pod
      range_name    = var.names.pod
    },
    {
      ip_cidr_range = var.subnets.service
      range_name    = var.names.service
    }
  ]
}
