output "principal_id" {
  value = azurerm_linux_function_app.func_app_python_backend.identity[0].principal_id
}