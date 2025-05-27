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

output "sql_server_id" {
  value = azurerm_sql_server.example.id
}

output "sql_database_connection_string" {
  value = "Server=tcp:${azurerm_sql_server.example.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_sql_database.example.name};Persist Security Info=False;User ID=${var.administrator_login};Password=${var.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}