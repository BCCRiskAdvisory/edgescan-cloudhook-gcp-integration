// Enable all the APIs
locals {
  gcp_service_list = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "dns.googleapis.com"
  ]
}

resource "google_project_service" "enable_apis" {
  for_each = toset(local.gcp_service_list)
  service  = each.key
}

// Create service account
resource "google_service_account" "service_account" {
  display_name = var.account_name
  account_id   = "edgescan-integration"
  description  = "Service account for Edgescan Cloudhook integration"
}

// Add roles to service account
resource "google_project_iam_member" "add_network_viewer_role" {
  project = var.project_id
  role    = "roles/compute.networkViewer"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}

resource "google_project_iam_member" "add_dns_reader_role" {
  project = var.project_id
  role    = "roles/dns.reader"
  member  = "serviceAccount:${google_service_account.service_account.email}"
}
