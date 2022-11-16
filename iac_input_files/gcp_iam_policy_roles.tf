resource "google_folder_iam_policy" "folder" {
  folder      = "folders/1234567"
  policy_data = data.google_iam_policy.admin.policy_data
}

# Data Source Resource - IAM Policy
data "google_iam_policy" "admin" {
  binding {
    role = "roles/editor"

    members = [
      "user:jane@example.com",
    ]
  }
}

resource "google_folder_iam_binding" "folder" {
  folder  = "folders/1234567"
  role    = "roles/editor"

  members = [
    "user:jane@example.com",
  ]
}

resource "google_folder_iam_member" "folder" {
  folder  = "folders/1234567"
  role    = "roles/editor"
  member  = "user:jane@example.com"
}