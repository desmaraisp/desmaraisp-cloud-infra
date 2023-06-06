resource "cloudflare_zone_settings_override" "desmaraisp-com-settings" {
  zone_id = var.CLOUDFLARE_ZONE_ID

  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}
