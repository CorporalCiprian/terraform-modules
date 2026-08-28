variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "project_name" {
  type = string
}

variable "env" {
  type = string
}

variable "location" {
  type = string
}

variable "serviceplan" {
  type = string
}

variable "app_settings" {
  type = map(string)
}

variable "stgname" {
  type = string
}

variable "subnet_id" {
  type = string
  default = null
}

variable "site_config" {
  type = object({
     application_stack = object({
       python_version = optional(string)
       node_version = optional(string) 
     })
     always_on = optional(bool,false)
     api_definition_url = optional(string)
     api_management_api_id = optional(string)
     app_command_line = optional(string)
     app_scale_limit = optional(string)
     application_insights_connection_string = optional(string)
     application_insights_key = optional(string)
     vnet_route_all_enabled = optional(bool,false)
  })
}

variable "ip_restrictions" {
  type = map(object({
    action = optional(string,"Allow")
    ip_address = optional(string)
    priority = optional(string,"65000")
    service_tag = optional(string)
    virtual_network_subnet_id = optional(string)
    description = optional(string)
  }))
}