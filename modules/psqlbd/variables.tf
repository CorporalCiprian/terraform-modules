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
  type = string
  default = null
}

variable "subnet_id" {
  type = string
  default = null
}

variable "dnszone" {
  type = string
  default = null
}

variable "adminname" {
  type = string
  default = null
}

variable "sku" {
  type = string
  default = "B_Standard_B1ms"
}

variable "netaccess" {
  type = bool
  default = true
}

variable "bd_version" {
  type = string
  default = "16"
}

variable "databases" {
  type = map(object({
    charset = optional(string)
    collation = optional(string)
  }))
}