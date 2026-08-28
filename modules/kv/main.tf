data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                       = "kv-${var.project_name}-${var.env}v"
  location                   = var.location
  resource_group_name        = var.rgname
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = var.sku
  soft_delete_retention_days = var.soft_delete_retention_days
  rbac_authorization_enabled = var.rbac_authorization_enabled
  dynamic "network_acls" {
    for_each = var.network_acls == true ? [1] : []
    content {
      default_action = var.default_action
      bypass         = var.bypass
      ip_rules = var.ip_rules
    }
  } 
}