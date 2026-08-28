output "subnet_ids" {
  value = {
    for k, v in azurerm_subnet.snet : k => v.id 
  }
}

output "address_prefix" {
  value = {
    for k, v in azurerm_subnet.snet : k => v.address_prefix
  }
}