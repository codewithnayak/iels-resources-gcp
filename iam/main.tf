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
