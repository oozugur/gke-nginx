resource "google_storage_bucket" "state" {
  name          = "terraform-state-bucket-321312"
  location      = "EU"
  force_destroy = true
}
