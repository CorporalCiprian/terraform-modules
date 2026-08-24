resource "azurerm_linux_function_app" "func_app_python_backend"{
    name                = "func-app-${var.project_name}-backend-${var.env}"
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
    always_on              = true
    vnet_route_all_enabled = var.networkaccess == "private" ? true : false
    ip_restriction_default_action = var.networkaccess == "private" ? "Deny" : "Allow"
    ip_restriction {
      action      = "Allow"
      service_tag = "AzureCloud"
      priority    = 100
      name        = "AllowAzureCloud"
    }
    ip_restriction {
      action = "Allow"
      ip_address = "136.255.102.82/32"
      priority = 100
    }
  }

  app_settings = {
    "SCM_DO_BUILD_DURING_DEPLOYMENT" = tostring(var.build_in_azure)
    "ENABLE_ORYX_BUILD"              = tostring(var.build_in_azure)

    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "AzureWebJobsFeatureFlags" = "EnableWorkerIndexing"
    "FUNCTIONS_WORKER_RUNTIME" = "python"

    "DATABASE_URL" = var.db_url

    "ALLOWED_ORIGINS"                  = var.allowedorigins
    
    "AzureWebJobsStorage__accountName" = var.stgname

    "env" = var.env
  }

  lifecycle {
    ignore_changes = [app_settings["WEBSITE_RUN_FROM_PACKAGE"], app_settings["AzureWebJobsStorage__accountName"],]
  }
}