variable "project_name" {
    type=string
    default = "todo"
}

variable "env" {
  type = string
  default = "dev"
}

variable "rgname" {
  type=string
}

variable "location" {
  type = string
}

variable "sku" {
  type = string
}

variable "soft_delete_retention_days" {
  type = number
  default = 7
}

variable "rbac_authorization_enabled" {
  type = bool 
  default = false
}

variable "network_acls" {
  type = bool
  default = false
}

variable "default_action" {
  type = string
  default = null
}

variable "bypass" {
  type = string
  default = null
}

variable "ip_rules" {
  type = list(string)
  default = []
}