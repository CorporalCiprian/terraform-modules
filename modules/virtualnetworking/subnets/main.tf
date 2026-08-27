resource "azurerm_subnet" "snet" {
  for_each = var.subnets
  name = each.key
  resource_group_name = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes = each.value.address_prefixes

  dynamic "delegation" {
    for_each = each.value.service_delegation == "true" ? [1] : []

    content {
      name = each.value.delegation_name

      service_delegation {
        name = each.value.service_name
        actions = each.value.delegation_actions
      }
    }
  }
}