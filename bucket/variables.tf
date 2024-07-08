variable "region" {
  type = string
  default = "europe-west2"
  validation {
    condition = can(regex("^europe-",var.region))
    error_message = "Region must be in europe"
  }
}