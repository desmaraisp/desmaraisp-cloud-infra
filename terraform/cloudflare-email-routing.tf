resource "cloudflare_email_routing_rule" "main" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  name    = "Forward GCP admin emails to GCP org owner"
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = "workspace-admin@desmaraisp.com"
  }

  action {
    type  = "forward"
    value = ["philippe.desmarais4@gmail.com"]
  }
}

resource "cloudflare_email_routing_settings" "desmaraisp-com" {
  zone_id = var.CLOUDFLARE_ZONE_ID
  enabled = "true"
}