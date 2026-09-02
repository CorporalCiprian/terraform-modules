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
  type = object({
    caching = string
    storage_account_type = optional(string)
    diff_disk_settings = optional(object({
        option = string
        placement = optional(string)
    }))
  })
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
  type = object({
    publisher = string
    offer = string
    sku = string
    version = string 
  })
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

variable "admin_ssh_key" {
  type = object({
    public_key = string
    username = string
  })
}

variable "custom_data" {
  type = string
  default = null
}

variable "identity" {
  type = object({
    type = string
    identity_ids = optional(string)
  })
  default = {}
}