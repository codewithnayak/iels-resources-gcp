variable "region" {
  type = string
  default = "europe-west2"
  validation {
    condition = can(regex("^europe-",var.region))
    error_message = "Region must be in europe"
  }
}

variable "project" {
  type = string
  default = "primeval-nectar-431120-j5"
}

variable "roles" {
  type    = list(string)
}

variable "name" {
  type = string
}

variable "display_name" {
  type = string
}