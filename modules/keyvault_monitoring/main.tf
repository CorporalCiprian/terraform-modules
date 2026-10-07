resource "azurerm_monitor_action_group" "action_group_test" {
  name = "ag-${var.kvname}-secrets"
  resource_group_name = var.rgname
  short_name = "ag-sec"
  dynamic "email_receiver" {
    for_each = var.email_receivers
    content {
      name = email_receivers.each.key
      email_address = email_receivers.each.value
    }
  }
}

resource "azurerm_log_analytics_workspace" "lga_kv" {
  name = "log-analytics-${var.kvname}"
  location = var.location
  resource_group_name = var.rgname
}

resource "azurerm_monitor_scheduled_query_rules_alert" "kv_secret_alert" {
  name = "${var.kvname}-secrets-near-expiry"
  location = var.location
  resource_group_name = var.rgname

  trigger {
    operator = "GreaterThan"
    threshold = 0
  }
  action {
    action_group = [ azurerm_monitor_action_group.action_group_test.id, ]
  }

  time_window = 5
  frequency = 5
  data_source_id = azurerm_log_analytics_workspace.lga_kv.id

  query       = <<-QUERY
  AzureDiagnostics 
  | where OperationName contains "SecretNearExpiry" 
  | project SecretName = column_ifexists("eventGridEventProperties_data_ObjectName_s", "eventGridEventProperties_data_ObjectName_s")
  QUERY
}
