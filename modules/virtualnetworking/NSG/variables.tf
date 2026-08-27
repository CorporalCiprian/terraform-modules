variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "security_rules" {
  type = map(object({
    name = string
    protocol = string
    description = optional(string)
    source_port_range = optional(string)
    source_port_ranges = optional(list(string))

    destination_port_range = optional(string)
    destination_port_ranges = optional(list(string))

    source_address_prefix = optional(string)
    source_address_prefixes = optional(list(string))
    source_application_security_group_ids = optional(list(string))

    destination_address_prefix = optional(string)
    destination_address_prefixes = optional(list(string))
    destination_application_security_group_ids = optional(list(string))

    access = string
    priority = string
    direction = string
  }))
}