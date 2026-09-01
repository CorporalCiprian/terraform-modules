resource "azurerm_linux_virtual_machine" "vm" {
  name = var.name
  network_interface_ids = var.network_interface_ids
  license_type = var.license_type
  dynamic "os_disk" {
    for_each = tomap(var.os_disk) 
    content {
        caching = each.value.caching
        storage_account_type = each.value.storage_account_type
        dynamic "diff_disk_settings" {
          for_each = each.value.caching == "ReadOnly" ? tomap(each.value.diff_disk_settings) : {}
          content {
            option = each.value.option
            placement = each.value.placement
          }
        }
    }
  }
  resource_group_name = var.resource_group_name
  size = var.size
  location = var.location

  dynamic "source_image_reference" {
    for_each = tomap(var.source_image_reference)
    content {
      publisher = each.value.publisher
      offer = each.value.offer
      sku = each.value.sku
      version = each.value.version
    }
  }
    admin_username = var.admin_username
    admin_password = var.admin_password

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_key
    content {
        public_key = each.value.public_key
        username = each.value.username
    }
  }
  custom_data = var.custom_data
}