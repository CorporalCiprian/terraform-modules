resource "azurerm_private_dns_zone" "private_dns" {
  name=var.dnsname
  resource_group_name = var.rgname
}

resource "azurerm_private_dns_zone_virtual_network_link" "vnet_dns_link" {
  name = var.linkname
  resource_group_name = var.rgname
  private_dns_zone_name = azurerm_private_dns_zone.private_dns.name
  virtual_network_id = var.vnetid
}