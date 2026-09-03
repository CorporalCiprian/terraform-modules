resource "azurerm_windows_virtual_machine" "vm" {
  name = var.name
  network_interface_ids = var.network_interface_ids
  license_type = var.license_type
  dynamic "os_disk" {
    for_each = var.os_disk 
    content {
        caching = each.value.caching
        storage_account_type = each.value.storage_account_type
        dynamic "diff_disk_settings" {
          for_each = each.value.caching == "ReadOnly" ? each.value.diff_disk_settings : {}
          content {
            option = each.value.option
            placement = each.value.placement
          }
        }
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      type = each.value.type
      identity_ids = each.value.identity_ids
    }
  }
  resource_group_name = var.resource_group_name
  size = var.size
  location = var.location

  dynamic "source_image_reference" {
    for_each = var.source_image_reference
    content {
      publisher = each.value.publisher
      offer = each.value.offer
      sku = each.value.sku
      version = each.value.version
    }
  }
  admin_username = var.admin_username
  admin_password = var.admin_password
  custom_data = var.custom_data
}