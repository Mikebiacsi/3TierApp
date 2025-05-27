output "frontdoor_endpoint" {
  value = azurerm_frontdoor.example.frontend_endpoint[0].host_name
}