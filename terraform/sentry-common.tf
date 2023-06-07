data "sentry_organization" "main" {
  slug = var.SENTRY_ORG
}
data "sentry_organization_integration" "github" {
  organization = var.SENTRY_ORG
  provider_key = "github"
  name         = "desmaraisp"
}
data "sentry_team" "main" {
  slug = "desmaraisp"
  organization = var.SENTRY_ORG
}
