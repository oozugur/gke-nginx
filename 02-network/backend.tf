terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket-321312"
    prefix = "terraform/state/network"
  }
  required_version = ">= 1.2.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.24"
    }
  }
}

provider "google" {
  credentials = file("../sa.json")
  project     = var.project
}
