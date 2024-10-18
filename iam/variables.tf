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
  default = "keen-ally-438611-t7"
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

variable "k8s_namespace" {
  type = string
  default = "jenkins"
}

variable "k8s-sa" {
  type = string
}

variable "isWorkload" {
  type = bool
  default = false
}