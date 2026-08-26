resource "azurerm_linux_function_app" "func_app_node" {
  name = var.name
  resource_group_name = var.resource_group_name
  service_plan_id     = var.serviceplan
  location            = var.location

  storage_uses_managed_identity = true
  storage_account_name          = var.stgname

  virtual_network_subnet_id = var.subnet_id

  identity {
    type = "SystemAssigned"
  }
  site_config {
    application_stack {
      node_version = "24"
    }
    always_on = true
  }

  app_settings = merge(var.app_settings, {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "AzureWebJobsFeatureFlags" = "EnableWorkerIndexing"
    "FUNCTIONS_WORKER_RUNTIME" = "node"
  })

  lifecycle {
    ignore_changes = [app_settings["WEBSITE_RUN_FROM_PACKAGE"], app_settings["AzureWebJobsStorage__accountName"],]
  }
}