module "kubernetes_sa" {
    source = "git::https://github.com/codewithnayak/gcp-generic-tf-templates.git//modules/k8s-sa?ref=main"
    cluster_name = var.cluster_name
    location = var.location
    annotate_service_account = var.annotate_service_account
    gcp_service_account_email = var.gcp_service_account_email
    kubernetes_service_account_name = var.kubernetes_service_account_name
    kubernetes_service_account_namespace = var.kubernetes_service_account_namespace
}