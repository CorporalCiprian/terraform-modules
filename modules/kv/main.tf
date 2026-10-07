data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "kv" {
  name                       = var.name
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

module "monitoring" {
  count = var.enable_secret_expiration_alert == true ? 1 : 0
  source = "git::https://github.com/CorporalCiprian/terraform-modules//modules/keyvault_monitoring"
  rgname = var.rgname
  location = var.location
  kv_id = azurerm_key_vault.kv.id
  kvname = azurerm_key_vault.kv.name
  email_receivers = var.email_receivers
}