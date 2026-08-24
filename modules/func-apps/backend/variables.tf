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

variable "allowedorigins" {
  type = string
}

variable "build_in_azure" {
  type = bool 
}

variable "db_url" {
  type = bool
}

variable "networkaccess" {
  type = string
  description = "type of network access to this resource, should be public or private"
}