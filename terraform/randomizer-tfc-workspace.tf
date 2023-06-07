resource "tfe_workspace" "randomizer" {
  name               = "randomizer-workspace"
  organization       = "desmaraisp-org"
  allow_destroy_plan = true
}

resource "tfe_variable" "randomizer-GCP-project-number" {
  key          = "TFC_GCP_PROJECT_NUMBER"
  value        = google_project.randomizer-project.project_id
  category     = "env"
  workspace_id = tfe_workspace.randomizer.id
}
resource "tfe_variable" "randomizer-GCP-provider-auth" {
  key          = "TFC_GCP_PROVIDER_AUTH"
  value        = true
  category     = "env"
  workspace_id = tfe_workspace.randomizer.id
}
resource "tfe_variable" "randomizer-GCP-SA-acc" {
  key          = "TFC_GCP_RUN_SERVICE_ACCOUNT_EMAIL"
  value        = google_service_account.randomizer_service_account.email
  category     = "env"
  workspace_id = tfe_workspace.randomizer.id
}
resource "tfe_variable" "randomizer-GCP-workload-pool-id" {
  key          = "TFC_GCP_WORKLOAD_POOL_ID"
  value        = google_iam_workload_identity_pool.randomizer.id
  category     = "env"
  workspace_id = tfe_workspace.randomizer.id
}
resource "tfe_variable" "randomizer-GCP-workload-provider" {
  key          = "TFC_GCP_WORKLOAD_PROVIDER_ID"
  value        = google_iam_workload_identity_pool_provider.randomizer.id
  category     = "env"
  workspace_id = tfe_workspace.randomizer.id
}