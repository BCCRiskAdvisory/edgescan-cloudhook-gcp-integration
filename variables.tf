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
