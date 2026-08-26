resource "azurerm_virtual_network" "vnet" {
    name = "vnet-${var.project_name}-${var.env}"
    location = var.location
    resource_group_name = var.rgname
    address_space = var.address_space
}