data "google_client_config" "default" {}

provider "kubernetes" {
  host                   = "https://${module.gke.endpoint}"
  token                  = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.gke.ca_certificate)
}

module "gke" {
  version = "~> 21.1.0"
  source  = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"

  project_id                 = var.project
  name                       = var.names.cluster_name
  regional                   = false
  zones                      = var.zones
  network                    = local.network
  network_project_id         = var.project
  subnetwork                 = local.node_network
  ip_range_pods              = local.pod_network
  ip_range_services          = local.service_network
  master_ipv4_cidr_block     = var.subnets.master_ip
  horizontal_pod_autoscaling = true
  enable_private_nodes       = true
  enable_private_endpoint    = false
  grant_registry_access      = true
  remove_default_node_pool   = true
  create_service_account     = false
  service_account            = google_service_account.kubernetes.email
  release_channel            = "REGULAR"
  node_pools = [
    {
      name           = "main-pool"
      machine_type   = "e2-micro"
      image_type     = "COS_CONTAINERD"
      node_locations = join(",", "${var.zones}")
      disk_size_gb   = 25
      min_count      = 1
      max_count      = 2
      autoscaling    = true
      auto_repair    = true
      auto_upgrade   = true
    }
  ]

  node_pools_labels = {
    all = {}
  }

  node_pools_taints = {
    all = []
  }

  node_pools_metadata = {
    all = {
      disable-legacy-endpoints = "true"
    }
  }
}

module "gke_workload_identity_default" {
  depends_on   = [module.gke]
  source       = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version      = "~> 21.1.0"
  cluster_name = var.names.cluster_name
  name         = "${var.names.cluster_name}-wi"
  namespace    = "default"
  project_id   = var.project
  roles        = ["roles/editor"]
}
