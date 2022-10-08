resource "google_service_account" "kubernetes" {
  project      = var.project
  account_id   = "kubernetes"
  display_name = "kubernetes Service Account"
}

resource "google_project_iam_member" "editor" {
  project = var.project
  role    = "roles/editor"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}

resource "google_project_iam_member" "gke_node_network_user" {
  project = var.project
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}
resource "google_project_iam_member" "gke_node_kubernetes_user" {
  project = var.project
  role    = "roles/container.hostServiceAgentUser"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}

resource "google_project_iam_member" "gke_network_user" {
  project = var.project
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}

resource "google_project_iam_member" "compute_security_admin" {
  project = var.project
  role    = "roles/compute.securityAdmin"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}

resource "google_project_iam_member" "gke_service_agent_user" {
  project = var.project
  role    = "roles/container.hostServiceAgentUser"
  member  = "serviceAccount:${google_service_account.kubernetes.email}"
}
