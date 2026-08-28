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
      python_version = var.site_config.python_version
      node_version = var.site_config.node_version 
    }
     always_on = optional(bool,false)
     api_definition_url = optional(string)
     api_management_api_id = optional(string)
     app_command_line = optional(string)
     app_scale_limit = optional(string)
     application_insights_connection_string = optional(string)
     application_insights_key = optional(string)
     vnet_route_all_enabled = optional(bool,false)
    
    dynamic "ip_restriction" {
      for_each = var.ip_restrictions
      content {
        action = each.value.action
        ip_address = each.value.ip_address
        name = each.key
        priority = each.value.priority
        service_tag = each.value.service_tag
        virtual_network_subnet_id = each.value.virtual_network_subnet_id
        description = each.value.description
    }
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