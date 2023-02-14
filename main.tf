// Enable all the APIs
resource "google_project_service" "enable_apis" {
  for_each = toset(var.gcp_service_list)
  service  = each.key
}

// Create service account
resource "google_service_account" "service_account" {
  display_name = var.account_name
  account_id   = "edgescan-integration"
  description  = "Service account for Edgescan Cloudhook integration"
}

// Add roles to service account
resource "google_project_iam_binding" "add_network_viewer_role" {
  project = var.project_id
  role    = "roles/compute.networkViewer"
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}

resource "google_project_iam_binding" "add_dns_reader_role" {
  project = var.project_id
  role    = "roles/dns.reader"
  members = [
    "serviceAccount:${google_service_account.service_account.email}",
  ]
}

// Create key 
resource "google_service_account_key" "key_file" {
  service_account_id = google_service_account.service_account.name
}
