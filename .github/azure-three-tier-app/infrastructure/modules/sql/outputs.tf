output "sql_connection_string" {
  value = "Server=tcp(${azurerm_sql_server.example.name}.database.windows.net);Database=${azurerm_sql_database.example.name};User ID=${azurerm_sql_server.example.administrator_login}@${azurerm_sql_server.example.name};Password=${azurerm_sql_server.example.administrator_login_password};Encrypt=true;TrustServerCertificate=false;Connection Timeout=30;"
}

output "sql_database_id" {
  value = azurerm_sql_database.example.id
}