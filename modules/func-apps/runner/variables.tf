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

variable "stgname" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "build_in_azure" {
  type = bool 
  default = true
}

variable "networkaccess" {
  type = string
  description = "type of network access to this resource, should be public or private"
  default = "public"
}

variable "subscription_id" {
  type = string
}

variable "vm_rg" {
  type = string
}

variable "vm_name" {
  type = string
}