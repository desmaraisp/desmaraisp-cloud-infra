resource "google_project" "randomizer-project" {
  project_id = "desmaraisp-randomizer-project"
  name       = "randomizer-project"
  org_id     = var.GCP_ROOT_ORG
}

resource "google_project_service" "gcp_services" {
  project = google_project.randomizer-project.project_id
  for_each = toset([
    "iam.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "iamcredentials.googleapis.com",
    "sts.googleapis.com"
  ])
  service = each.key
}
resource "google_service_account" "randomizer_service_account" {
  project      = google_project.randomizer-project.project_id
  account_id   = "oidc-tfc-service-account"
  display_name = "tfc service account"
}

resource "google_iam_workload_identity_pool" "randomizer" {
  project                   = google_project.randomizer-project.project_id
  workload_identity_pool_id = "tfc-oidc-pool2"
  description               = "Identity pool used by tfc OIDC to login"
  disabled                  = false
}

resource "google_iam_workload_identity_pool_provider" "randomizer" {
  project                            = google_project.randomizer-project.project_id
  workload_identity_pool_id          = google_iam_workload_identity_pool.randomizer.workload_identity_pool_id
  workload_identity_pool_provider_id = "tfc-oidc-pool-provider2"
  description                        = "Identity pool used by tfc OIDC to login"
  attribute_mapping = {
    "google.subject"                        = "assertion.sub",
    "attribute.aud"                         = "assertion.aud",
    "attribute.terraform_run_phase"         = "assertion.terraform_run_phase",
    "attribute.terraform_project_id"        = "assertion.terraform_project_id",
    "attribute.terraform_project_name"      = "assertion.terraform_project_name",
    "attribute.terraform_workspace_id"      = "assertion.terraform_workspace_id",
    "attribute.terraform_workspace_name"    = "assertion.terraform_workspace_name",
    "attribute.terraform_organization_id"   = "assertion.terraform_organization_id",
    "attribute.terraform_organization_name" = "assertion.terraform_organization_name",
    "attribute.terraform_run_id"            = "assertion.terraform_run_id",
    "attribute.terraform_full_workspace"    = "assertion.terraform_full_workspace",
  }
  oidc {
    issuer_uri = "https://app.terraform.io"
  }
  attribute_condition = "assertion.sub.startsWith(\"organization:${var.TFC_ORGANIZATION}:project:${var.TFC_RANDOMIZER_PROJECT}:workspace:${var.TFC_RANDOMIZER_WORKSPACE}\")"
}

resource "google_service_account_iam_member" "randomizer-sa-workload" {
  service_account_id = google_service_account.randomizer_service_account.id
  role               = "roles/iam.workloadIdentityUser"
  member             = "principalSet://iam.googleapis.com/${google_iam_workload_identity_pool.randomizer.name}/attribute.repository/desmaraisp/YoutubeMixer"
}

resource "google_project_iam_member" "sa-owner-role" {
  project = google_project.randomizer-project.project_id
  role    = "roles/owner"
  member  = "serviceAccount:${google_service_account.randomizer_service_account.email}"
}
