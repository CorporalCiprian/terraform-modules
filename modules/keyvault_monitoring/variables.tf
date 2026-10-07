variable "rgname" {
  type = string
}

variable "location" {
  type = string
}

variable "kv_id" {
  type = string
}

variable "kvname" {
  type = string
}

variable "email_receivers" {
  type = map(string)
  default = {}
}