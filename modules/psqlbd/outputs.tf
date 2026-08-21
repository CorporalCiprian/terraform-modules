output "administrator_login" {
    value = azurerm_postgresql_flexible_server.db_server.administrator_login
}

output "fqdn" {
    value = azurerm_postgresql_flexible_server.db_server.fqdn
}

output "name" {
  value = azurerm_postgresql_flexible_server_database.todo_db.name
}