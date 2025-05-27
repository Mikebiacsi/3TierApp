resource "azurerm_sql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
}

resource "azurerm_sql_database" "example" {
  name                = var.database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  server_name         = azurerm_sql_server.example.name
  sku {
    name     = var.database_sku
    tier     = var.database_tier
    capacity = var.database_capacity
  }
  geo_redundant_backup_enabled = true
}

resource "azurerm_sql_database_geo_backup" "example" {
  database_id = azurerm_sql_database.example.id
  location    = var.geo_location
}

# Create Azure Key Vault
resource "azurerm_key_vault" "example" {
  name                        = "${var.resource_group_name}-kv"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = false
}

output "sql_server_id" {
  value = azurerm_sql_server.example.id
}



# Output Key Vault details
output "key_vault_id" {
  value = azurerm_key_vault.example.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.example.vault_uri
}