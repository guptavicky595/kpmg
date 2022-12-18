resource "google_project_iam_member" "iam_users" {
  for_each = toset(var.users)

  role   = "roles/viewer"
  member = each.key
}

resource "google_service_account" "service_account" {
  account_id   = "ns-sync"
  display_name = "NS Sync"
}

/*
resource "google_project_iam_member" "iam_users" {
 role   = "roles/viewer"
  member = serviceAccount:
}
*/
