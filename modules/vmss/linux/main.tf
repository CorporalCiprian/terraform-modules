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
    for_each = var.source_image_reference
    content {
        publisher = source_image_reference.value.publisher
        offer = source_image_reference.value.offer
        sku = source_image_reference.value.sku
        version = source_image_reference.value.version
    }
  }

  dynamic "identity" {
    for_each = var.identity
    content {
      type = identity.value.type
      identity_ids = identity.value.identity_ids
    }
  }
  
  admin_username = var.admin_username
  admin_password = var.admin_password
  disable_password_authentication = var.admin_password != null ? true : false
  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_keys
    content {
        username = admin_ssh_key.value.username
        public_key = admin_ssh_key.value.public_key
    }
  }
  dynamic "network_interface" {
    for_each = var.network_interfaces
    content {
      name = network_interface.key
      primary = network_interface.value.primary

      dynamic "ip_configuration" {
        for_each = network_interface.value.ip_configurations
        content {
          name = ip_configuration.key
          primary = ip_configuration.value.primary
          subnet_id = ip_configuration.value.subnet_id
          dynamic "public_ip_address" {
            for_each = ip_configuration.value.public_ip_address
            content {
              name = public_ip_address.value.name
              public_ip_prefix_id = public_ip_address.value.public_ip_prefix_id
            }
          }
        }
      }
    }
  }
  custom_data = var.custom_data
}