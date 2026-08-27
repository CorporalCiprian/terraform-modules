resource "azurerm_network_security_group" "nsg" {
    name = var.name
    location = var.location
    resource_group_name = var.resource_group_name
}

resource "azurerm_network_security_rule" "rule" {
  for_each = var.security_rules
  name = each.name
  resource_group_name = each.resource_group_name
  protocol = each.protocol
  description = each.description

  source_port_range = each.source_port_range
  source_port_ranges = each.source_port_ranges

  destination_port_range = each.destination_port_range
  destination_port_ranges = each.destination_port_ranges

  source_address_prefix = each.source_address_prefix
  source_address_prefixes = each.source_address_prefixes
  source_application_security_group_ids = each.source_application_security_group_ids

  destination_address_prefix = each.destination_address_prefix
  destination_address_prefixes = each.destination_address_prefixes
  destination_application_security_group_ids = each.destination_application_security_group_ids

  access = each.access
  priority = each.priority
  direction = each.direction
  network_security_group_name = azurerm_network_security_group.nsg.name

}