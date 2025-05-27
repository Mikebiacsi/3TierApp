resource "azurerm_app_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    tier     = "Basic"
    size     = "B1"
    capacity = 1
  }
}

resource "azurerm_app_service" "app_service" {
  name                = var.app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.app_service_plan.id

  app_settings = {
    "WEBSITE_NODE_DEFAULT_VERSION" = "14"
  }

  https_only = true
}

output "app_service_url" {
  value = azurerm_app_service.app_service.default_site_hostname
}