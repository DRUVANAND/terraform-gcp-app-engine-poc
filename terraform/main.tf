resource "google_service_account" "custom_service_account" {
  account_id   = "my-account"
  display_name = "Custom Service Account"
}

resource "google_project_iam_member" "gae_api" {
  project = google_service_account.custom_service_account.project
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:${google_service_account.custom_service_account.email}"
}

resource "google_project_iam_member" "storage_viewer" {
  project = google_service_account.custom_service_account.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.custom_service_account.email}"
}

resource "google_app_engine_application" "app" {
  project     = "engineer-cloud-nprod"
  location_id = "us-central1"
}


resource "google_storage_bucket" "bucket" {
  name     = "dhruv-appengine-github"
  location = "US"
}

resource "google_storage_bucket_object" "object" {
  name   = "hello-world.zip"
  bucket = google_storage_bucket.bucket.name
  source = "./hello-world.zip"
}
