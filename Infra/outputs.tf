output "frontend_app_url" {
  value = "https://${azurerm_linux_web_app.frontend.default_hostname}"
}

output "backend_app_url" {
  value = "https://${azurerm_linux_web_app.backend.default_hostname}"
}

output "frontend_staging_url" {
  value = "https://${azurerm_linux_web_app_slot.frontend_staging.default_hostname}"
}

output "backend_staging_url" {
  value = "https://${azurerm_linux_web_app_slot.backend_staging.default_hostname}"
}
