resource "azurerm_mssql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "example" {
  name           = var.sql_database_name
  server_id      = azurerm_mssql_server.example.id
  sku_name       = var.database_sku
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb    = 5
  zone_redundant = false
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
  value = azurerm_mssql_server.example.id
}



# Output Key Vault details
output "key_vault_id" {
  value = azurerm_key_vault.example.id
}

output "key_vault_uri" {
  value = azurerm_key_vault.example.vault_uri
}