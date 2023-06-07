resource "sentry_team" "randomizer" {
  organization = data.sentry_organization.main.id
  name         = "randomizer"
}

resource "sentry_organization_repository_github" "randomizer" {
  organization   = var.SENTRY_ORG
  integration_id = data.sentry_organization_integration.github.internal_id
  identifier     = "desmaraisp/YoutubeMixer"
}

resource "sentry_organization_code_mapping" "randomizer" {
  organization   = var.SENTRY_ORG
  integration_id = data.sentry_organization_integration.github.internal_id
  repository_id  = sentry_organization_repository_github.randomizer.internal_id
  project_id     = sentry_project.randomizer.internal_id

  default_branch = "main"
  stack_root     = "/"
  source_root    = "src/"
}

resource "sentry_project" "randomizer" {
  organization = sentry_team.randomizer.organization
  teams        = [sentry_team.randomizer.id, data.sentry_team.main.id]
  name         = "randomizer"
  platform     = "javascript-nextjs"
}

data "sentry_key" "randomizer-default" {
  organization = var.SENTRY_ORG
  project      = sentry_project.randomizer.id

  name = "Default"
}