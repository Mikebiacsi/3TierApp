provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  vnet_name          = var.vnet_name
  address_space      = var.address_space
}

module "frontdoor" {
  source              = "./modules/frontdoor"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  frontend_host_name  = var.frontend_host_name
  backend_pool_settings = module.networking.backend_pool_settings
}

module "appservice" {
  source              = "./modules/appservice"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  app_service_name    = var.app_service_name
  service_plan_id     = module.appservice.service_plan_id
}

module "logicapps" {
  source              = "./modules/logicapps"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  workflow_name       = var.workflow_name
}

module "sql" {
  source              = "./modules/sql"
  resource_group_name = azurerm_resource_group.main.name
  location           = azurerm_resource_group.main.location
  database_name       = var.database_name
  performance_tier    = var.performance_tier
}

output "frontdoor_endpoint" {
  value = module.frontdoor.frontdoor_endpoint
}

output "app_service_url" {
  value = module.appservice.app_url
}

output "logic_app_url" {
  value = module.logicapps.logic_app_url
}

output "sql_connection_string" {
  value = module.sql.connection_string
}