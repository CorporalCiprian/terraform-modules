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
      python_version = var.site_config.application_stack.python_version
      node_version = var.site_config.application_stack.node_version 
    }
     always_on = var.site_config.always_on
     api_definition_url = var.site_config.api_definition_url
     api_management_api_id = var.site_config.api_management_api_id
     app_command_line = var.site_config.app_command_line
     app_scale_limit = var.site_config.app_scale_limit
     application_insights_connection_string = var.site_config.application_insights_connection_string
     application_insights_key = var.site_config.application_insights_key
     vnet_route_all_enabled = var.site_config.vnet_route_all_enabled
    
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions != null ? var.ip_restrictions : {}
      content {
        action = ip_restrictions.value.action
        ip_address = ip_restrictions.value.ip_address
        name = ip_restrictions.key
        priority = ip_restrictions.value.priority
        service_tag = ip_restrictions.value.service_tag
        virtual_network_subnet_id = ip_restrictions.value.virtual_network_subnet_id
        description = ip_restrictions.value.description
    }
  }
  }
  app_settings = merge(var.app_settings, {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "AzureWebJobsFeatureFlags" = "EnableWorkerIndexing"
  })

  lifecycle {
    ignore_changes = [app_settings["WEBSITE_RUN_FROM_PACKAGE"], app_settings["AzureWebJobsStorage__accountName"], app_settings["WEBSITE_VNET_ROUTE_ALL"]]
  }
}