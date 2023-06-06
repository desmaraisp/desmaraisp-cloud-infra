resource "google_project" "randomizer-project" {
  project_id = "desmaraisp-randomizer-project"
  name = "randomizer-project"
  org_id = var.GCP_ROOT_ORG
}