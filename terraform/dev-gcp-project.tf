resource "google_project" "dev-project" {
  project_id = "desmaraisp-dev-project"
  name       = "dev-project"
  org_id     = var.GCP_ROOT_ORG
}

resource "google_project_service" "dev-youtube-api" {
  service = "youtube.googleapis.com"
  project = google_project.dev-project.id
}



resource "google_apikeys_key" "dev-youtube" {
  name         = "dev-youtube-api-key"
  display_name = "Youtube API key for development pruposes"
  project      = google_project.dev-project.id

  restrictions {
    api_targets {
      service = "youtube.googleapis.com"
    }
  }

  depends_on = [
    google_project_service.api-keys,
    google_project_service.dev-youtube-api,
  ]
}
