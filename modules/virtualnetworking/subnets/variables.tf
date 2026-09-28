variable "resource_group_name" {
  type = string
}

variable "virtual_network_name" {
  type = string
}

variable "env" {
  type = string
  default = "dev"
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
    service_delegation = optional(bool,false)
    delegation_name = optional(string)
    service_name = optional(string)
    delegation_actions = optional(list(string))
  }))
}