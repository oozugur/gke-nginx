resource "google_service_account" "sa" {
  project      = var.project
  account_id   = "terraformsa"
  display_name = "Terraform Service Account"
}

resource "google_project_iam_member" "gke" {
  project = var.project
  role    = "roles/container.developer"
  member  = "serviceAccount:${google_service_account.sa.email}"
}
