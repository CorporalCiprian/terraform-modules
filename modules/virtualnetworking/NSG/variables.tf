variable "name" {
  type = string
}

variable "location" {
  type = string
}

variable "rgname" {
  type = string
}

variable "security_rules" {
  type = map(object({
    name = string
    resource_group_name = string
    protocol = string
    description = optional(string)
    source_port_range = optional(string)
    source_port_ranges = optional(string)

    destination_port_range = optional(string)
    destination_port_ranges = optional(string)

    source_address_prefix = optional(string)
    source_address_prefixes = optional(string)
    source_application_security_group_ids = optional(string)

    destination_address_prefix = optional(string)
    destination_address_prefixes = optional(string)
    destination_application_security_group_ids = optional(string)

    access = string
    priority = string
    direction = string
  }))
}