resource "azurerm_network_security_group" "nsg" {
    name = var.name
    location = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "rule" {
  for_each = var.security_rules
  name = each.value.name
  resource_group_name = each.value.resource_group_name
  protocol = each.value.protocol
  description = each.value.description

  source_port_range = each.value.source_port_range
  source_port_ranges = each.value.source_port_ranges

  destination_port_range = each.value.destination_port_range
  destination_port_ranges = each.value.destination_port_ranges

  source_address_prefix = each.value.source_address_prefix
  source_address_prefixes = each.value.source_address_prefixes
  source_application_security_group_ids = each.value.source_application_security_group_ids

  destination_address_prefix = each.value.destination_address_prefix
  destination_address_prefixes = each.value.destination_address_prefixes
  destination_application_security_group_ids = each.value.destination_application_security_group_ids

  access = each.value.access
  priority = each.value.priority
  direction = each.value.direction
  network_security_group_name = azurerm_network_security_group.nsg.name

}