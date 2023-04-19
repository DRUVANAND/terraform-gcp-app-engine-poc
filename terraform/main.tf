resource "google_app_engine_application" "main" {
  project        = "engineer-cloud-nprod"
  location_id    = "us-central1"
  auth_domain    = var.auth_domain
  serving_status = var.serving_status
  dynamic "feature_settings" {
    for_each = var.feature_settings
    content {
      split_health_checks = lookup(feature_settings.value, "split_health_checks", true)
    }
  }
}
