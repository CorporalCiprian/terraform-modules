variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "sku" {
  type = string
  default = "Standard_B2as_v2"
}

variable "instances" {
  type = number
  default = 0
}

variable "caching" {
  type = string
  default = "ReadWrite"
}

variable "storage_account_type" {
  type = string
  default = "Standard_LRS"
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
}

variable "admin_password" {
  type = string
  default = null
}

variable "admin_ssh_keys" {
  type = map(object({
    username = string
    public_key = string
  }))
  default = {}
}

variable "network_interfaces" {
  type = map(object({
    primary = optional(bool)
    ip_configurations = map(object({
      primary = optional(bool)
      subnet_id = optional(string)
      public_ip_address = optional(object({
        name = string
        public_ip_prefix_id = optional(string)
      }))
    }))
  }))
}

variable "custom_data" {
  type = string
  default = null
}