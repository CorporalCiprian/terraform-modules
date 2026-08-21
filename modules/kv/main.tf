data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "kv_module" {
  name                       = "kv-${var.project_name}-${var.env}v"
  location                   = var.location
  resource_group_name        = var.rgname
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name                   = "standard"
  soft_delete_retention_days = 7
  rbac_authorization_enabled = true
  network_acls {
    default_action = "Deny"
    bypass         = "AzureServices"
    ip_rules = [
      "136.255.102.82/32",
    ]
  } 
}