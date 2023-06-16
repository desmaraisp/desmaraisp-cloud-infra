resource "google_project_service" "api-keys" {
  service = "apikeys.googleapis.com"
  project = var.SHARED_INFRA_PROJECT
}
