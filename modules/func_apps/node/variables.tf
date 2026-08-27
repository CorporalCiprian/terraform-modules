variable "resource_group_name" {
  type = string
}

variable "name" {
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

variable "app_settings" {
  type = map(string)
}