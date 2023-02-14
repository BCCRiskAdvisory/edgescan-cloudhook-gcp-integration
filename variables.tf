variable "gcp_service_list" {
  description = "The list of necessary APIs"
  type        = list(string)
  default = [
    "compute.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "dns.googleapis.com"
  ]
}

variable "project_id" {
  description = "The google project ID"
  type        = string
  nullable    = false
}

variable "account_name" {
  description = "The name of the Edgescan Integration service account"
  type        = string
  nullable    = false
  default     = "Edgescan Integration"
}
