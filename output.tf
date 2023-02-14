output "json_key_file" {
  value = base64decode(nonsensitive(google_service_account_key.key_file.private_key))
}