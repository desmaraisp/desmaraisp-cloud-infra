resource "cloudflare_email_routing_rule" "main" {
  zone_id = "1452d4d6646a8641bd56c94f51970c50"
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