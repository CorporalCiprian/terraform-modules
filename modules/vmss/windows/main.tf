resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
  name = var.name
  resource_group_name = var.resource_group_name
  location = var.location
  sku = var.sku
  instances = var.instances
  os_disk {
    caching = var.caching
    storage_account_type = var.storage_account_type
  }
  dynamic "source_image_reference" {
    for_each = tomap(var.source_image_reference)
    content {
        publisher = each.value.publisher
        offer = each.value.offer
        sku = each.value.sku
        version = each.value.version
    }
  }

  dynamic "identity" {
    for_each = tomap(var.identity)
    content {
      type = each.value.type
      identity_ids = each.value.identity_ids
    }
  }
  
  admin_username = var.admin_username
  admin_password = var.admin_password
  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_keys
    content {
        username = each.value.username
        public_key = each.value.public_key
    }
  }
  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {
      name = each.key
      primary = each.value.primary

      dynamic "ip_configuration" {
        for_each = each.value.ip_configurations
        content {
          name = each.key
          primary = each.value.primary
          subnet_id = each.value.subnet_id
          dynamic "public_ip_address" {
            for_each = each.value.public_ip_address
            content {
              name = each.value.name
              public_ip_prefix_id = each.value.public_ip_prefix_id
            }
          }
        }
      }
    }
  }
  custom_data = var.custom_data
}