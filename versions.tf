terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.53"
    }
  }

  required_version = ">= 1.2.0"
}

provider "google" {
  project = var.project_id
}