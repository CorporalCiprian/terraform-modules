resource "azurerm_virtual_network" "vnet" {
    name = "vnet-todo-${var.env}"
    location = var.location
    resource_group_name = var.rgname
    address_space = ["10.0.0.0/25"]
}