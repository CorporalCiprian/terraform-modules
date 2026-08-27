output "subnet_ids" {
  value = {
    for k, v in azurerm_subnet.snet : k => v.id 
  }
}