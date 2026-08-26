variable "env" {
  type = string
}

variable "project_name" {
  type = string
  default = "todo"
}

variable "rgname" {
  type = string
}

variable "location" {
  type = string
}

variable "address_space" {
  type = set(string)  
}