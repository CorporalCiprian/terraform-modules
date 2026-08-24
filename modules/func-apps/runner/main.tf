resource "azurerm_linux_function_app" "func_app_runner_trigger_python" {
  name                = "func-app-${var.project_name}-runner-trigger-${var.env}"
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
      python_version = "3.12"
    }
    always_on = true
    vnet_route_all_enabled = var.networkaccess == "private" ? "true" : "false"
  }

  app_settings = {
    "AzureWebJobsFeatureFlags" = "EnableWorkerIndexing"
    "FUNCTIONS_WORKER_RUNTIME" = "python"

    "SCM_DO_BUILD_DURING_DEPLOYMENT" = tostring(var.build_in_azure)
    "Azure_Subscription_Id" = var.subscription_id
    "Vm_Resource_Group" = var.vm_rg
    "Vm_Name" = var.vm_name
    "AzureWebJobsStorage__accountName" = var.stgname

    "env" = var.env
  }

  lifecycle {
    ignore_changes = [ app_settings["AzureWebJobsStorage__accountName"], ]
  }
}