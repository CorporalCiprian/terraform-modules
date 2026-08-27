variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "snet_name_convention" {
  type = string
  default = "snet-${each.key}-dev"
}

variable "subnets" {
  type = map(object({
    address_prefixes = string
    service_delegation = optional(bool,false)
    delegation_name = optional(string)
    service_name = optional(string)
    delegation_actions = optional(list(string))
  }))
}