variable "project_name" {
  type = string
  default = "todo"
}

variable "env" {
  type = string
  default = "dev"
}

variable "rgname" {
  type = string
}

variable "location" {
  type = string
}

variable "sku" {
  type = string
  default = "Standard"
}

variable "account_replication_type" {
  type = string
  default = "LRS"  
}

variable "network_access" {
  type = bool
  default = true
}