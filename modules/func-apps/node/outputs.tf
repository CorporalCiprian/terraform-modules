output "name" {
  value = azurerm_linux_function_app.func_app_node.name
}

output "principal_id" {
  value = azurerm_linux_function_app.func_app_node.identity[0].principal_id
}