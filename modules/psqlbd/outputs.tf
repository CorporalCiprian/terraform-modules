output "administrator_login" {
    value = azurerm_postgresql_flexible_server.db_server.administrator_login
}

output "fqdn" {
    value = azurerm_postgresql_flexible_server.db_server.fqdn
}

output "dbnames" {
  value = {
    for k, v in azurerm_postgresql_flexible_server_database.db : k => v.name
  }
}