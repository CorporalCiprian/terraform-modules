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
}

variable "subnet_id" {
  type = string
}

variable "dnszone" {
  type = string
}

variable "adminname" {
  type = string
  default = "postgres"
}

variable "sku" {
  type = string
}

variable "netaccess" {
  type = bool
}