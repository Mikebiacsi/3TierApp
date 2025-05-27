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
  # location attribute removed as it is not expected
  vnet_name           = var.vnet_name
  address_space       = var.address_space
  subnet_prefixes     = var.subnet_prefixes
  subnet_names        = var.subnet_names
}

module "frontdoor" {
  source              = "./modules/frontdoor"
  resource_group_name = azurerm_resource_group.main.name
  # location attribute removed as it is not expected
  frontend_host_name  = var.frontend_host_name
  # backend_pool_settings attribute removed as it is not expected
}

module "appservice" {
  source              = "./modules/appservice"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  app_service_name    = var.app_service_name
  app_service_plan_id = var.app_service_plan_id
}

module "logicapps" {
  source              = "./modules/logicapps"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  workflow_name       = var.workflow_name
  workflow_definition = var.workflow_definition
  logic_app_name      = var.logic_app_name
}

module "sql" {
  source              = "./modules/sql"
  resource_group_name = var.resource_group_name
  location            = var.location
  sql_database_name   = var.sql_database_name
  sql_server_name     = var.sql_server_name
  sql_admin_username  = data.azurerm_key_vault_secret.sql_admin_username.value
  sql_admin_password  = data.azurerm_key_vault_secret.sql_admin_password.value
}

data "azurerm_key_vault" "example" {
  name                = var.key_vault_name
  resource_group_name = var.key_vault_resource_group
}

data "azurerm_key_vault_secret" "sql_admin_username" {
  name         = "sql-admin-username"
  key_vault_id = data.azurerm_key_vault.example.id
}

data "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "sql-admin-password"
  key_vault_id = data.azurerm_key_vault.example.id
}
