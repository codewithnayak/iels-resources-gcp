resource "google_service_account" "iels_servcie_account" {
  account_id = var.name
  display_name = var.display_name
}


resource "google_project_iam_member" "my_service_account_role" {
  for_each = toset(var.roles)
  project = var.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.iels_servcie_account.email}"
}


resource "google_service_account_iam_binding" "workload" {
  count = var.isWorkload ? 1 : 0
  service_account_id = google_service_account.iels_servcie_account.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${var.project}.svc.id.goog[${var.k8s_namespace}/${var.k8s-sa}]"
  ]
}
