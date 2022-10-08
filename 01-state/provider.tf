terraform {
  required_version = ">= 0.12.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.0"
    }
  }
}
provider "google" {
  credentials = file("../sa.json")
  project     = var.project
}
