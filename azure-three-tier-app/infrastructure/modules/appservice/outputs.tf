output "app_service_url" {
  value = azurerm_app_service.example.default_site_hostname
}

output "app_service_id" {
  value = azurerm_app_service.example.id
}