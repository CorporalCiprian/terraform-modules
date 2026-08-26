resource "azurerm_linux_function_app" "func_app"{
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location

  service_plan_id = var.serviceplan

  storage_uses_managed_identity = true
  storage_account_name          = var.stgname

  virtual_network_subnet_id = var.subnet_id

  identity {
    type = "SystemAssigned"
  }
  
  site_config {
    application_stack {
      python_version = "3.12"
    }
  }

  app_settings = merge(var.app_settings, {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "AzureWebJobsFeatureFlags" = "EnableWorkerIndexing"
  })

  lifecycle {
    ignore_changes = [app_settings["WEBSITE_RUN_FROM_PACKAGE"], app_settings["AzureWebJobsStorage__accountName"],]
  }
}