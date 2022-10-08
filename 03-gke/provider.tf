provider "google" {
  region = var.region
}

terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket-321312"
    prefix = "terraform/state/gke"
  }
  required_version = "~> 1.2.2"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.24"
    }
  }
}

data "terraform_remote_state" "network" {
  backend = "gcs"
  config = {
    bucket = "terraform-state-bucket-321312"
    prefix = "terraform/state/network"
  }
}
