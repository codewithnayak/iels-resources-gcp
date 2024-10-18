module "storage_bucket" {
    source = "git::https://github.com/codewithnayak/gcp-generic-tf-templates.git//modules/k8s-sa?ref=main"
    cluster_name = "iels-gke-oct-jan"
    location = "europe-west1-b"
    annotate_service_account = false
    gcp_service_account_email = ""
    kubernetes_service_account_name = "terraform-iam-service-account"
    kubernetes_service_account_namespace = "jenkins"
}