#
# Storage accounts
#
resource "azurerm_storage_account" "stg_func_app" {
  name = "stg${var.project_name}${var.env}"
  resource_group_name = var.rgname
  location = var.location
  account_tier    = "Standard"
  account_replication_type  = "LRS"
  public_network_access_enabled = false
}