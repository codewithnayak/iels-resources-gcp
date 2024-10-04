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

variable "name" {
  type = string
  default = "magic-terraform-instance"
}

variable "display_name" {
  type = string
  default = "Servcie account test display name"
}

variable "service_account_id" {
  type = string
  default = "my-custom-sa"
}

variable "machine_type" {
  type = string
  default = "e2-micro"
}