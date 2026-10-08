resource "azurerm_windows_virtual_machine" "vm" {
  name = var.name
  network_interface_ids = var.network_interface_ids
  license_type = var.license_type
  dynamic "os_disk" {
    for_each = var.os_disk 
    content {
        caching = os_disk.value.caching
        storage_account_type = os_disk.value.storage_account_type
        dynamic "diff_disk_settings" {
          for_each = os_disk.value.caching == "ReadOnly" ? os_disk.value.diff_disk_settings : {}
          content {
            option = diff_disk_settings.value.option
            placement = diff_disk_settings.value.placement
          }
        }
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      type = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
  resource_group_name = var.resource_group_name
  size = var.size
  location = var.location

  dynamic "source_image_reference" {
    for_each = var.source_image_reference
    content {
      publisher = source_image_reference.value.publisher
      offer = source_image_reference.value.offer
      sku = source_image_reference.value.sku
      version = source_image_reference.value.version
    }
  }
  admin_username = var.admin_username
  admin_password = var.admin_password
  custom_data = var.custom_data
}