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

variable "adminpass" {
  type = optional(string)
}

variable "subnet_id" {
  type = optional(string)
}

variable "dnszone" {
  type = optional(string)
}

variable "adminname" {
  type = optional(string)
}

variable "sku" {
  type = string
  default = "B_Standard_B1ms"
}

variable "netaccess" {
  type = bool
  default = true
}

variable "version" {
  type = string
  default = "16"
}