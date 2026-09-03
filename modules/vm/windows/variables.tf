variable "name" {
  type = string
}

variable "network_interface_ids" {
  type = list(string)
}

variable "license_type" {
  type = string
  default = null
}

variable "os_disk" {
  type = map(object({
    caching = string
    storage_account_type = optional(string)
    diff_disk_settings = optional(map(object({
        option = string
        placement = optional(string)
    })))
  }))
  default = {}
}

variable "resource_group_name" {
  type = string
}

variable "size" {
  type = string
  default = "Standard_B1ls"
}

variable "location" {
  type = string
}

variable "source_image_reference" {
  type = map(object({
    publisher = string
    offer = string
    sku = string
    version = string 
  }))
  default = {}
}

variable "admin_username" {
  type = string
  default = null
}

variable "admin_password" {
  type = string
  default = null
}

variable "custom_data" {
  type = string
  default = null
}

variable "identity" {
  type = map(object({
    type = string
    identity_ids = optional(string)
  }))
  default = {}
}