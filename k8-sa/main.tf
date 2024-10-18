resource "kubernetes_service_account" "example" {
  metadata {
    name      = var.kubernetes_service_account_name
    namespace = var.kubernetes_service_account_namespace

    annotations = var.annotate_service_account ?  {
      "iam.gke.io/gcp-service-account" = var.gcp_service_account_email
    } : {}
  }
}
