output "principal_id" {
  value = azurerm_linux_function_app.func_app_runner_trigger_python.identity[0].principal_id
}