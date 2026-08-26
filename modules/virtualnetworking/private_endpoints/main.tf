resource "azurerm_private_endpoint" "pep" {
  name = var.pepname
  subnet_id = var.subnet_id
  location = var.location
  resource_group_name = var.rgname

  private_service_connection {
    name = var.connectionname
    is_manual_connection = false
    private_connection_resource_id = var.connectionid
    subresource_names = var.subresource_names
  }

  private_dns_zone_group {
    name = var.dnsgroupname
    private_dns_zone_ids = var.dnszoneids
  }
}