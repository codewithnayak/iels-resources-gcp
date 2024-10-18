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

variable "cluster_name" {
  description = "GKE cluster name "
  type = string
  default = "value"
}

variable "location" {
  description = "Cluster lcoation"
  type = string
  default = "value"
}

variable "annotate_service_account" {
  description = "Whether to annotate the Kubernetes service account with a GCP service account"
  type        = bool
  default     = false
}

variable "gcp_service_account_email" {
  description = "The email of the GCP service account to annotate"
  type        = string
  default     = ""
}

variable "kubernetes_service_account_name" {
  type = string
  
}

variable "kubernetes_service_account_namespace" {
  type = string
}