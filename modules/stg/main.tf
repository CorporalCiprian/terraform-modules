#
# Storage accounts
#
resource "azurerm_storage_account" "stg" {
  name = "stg${var.project_name}${var.env}"
  resource_group_name = var.rgname
  location = var.location
  account_tier    = var.sku
  account_replication_type  = var.account_replication_type
  public_network_access_enabled = var.network_access
}