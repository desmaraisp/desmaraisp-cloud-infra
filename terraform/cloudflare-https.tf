resource "cloudflare_zone_settings_override" "desmaraisp-com-settings" {
  zone_id = var.CLOUDFLARE_ZONE_ID

  settings {
    tls_1_3                     = "on"
    automatic_https_rewrites    = "on"
    ssl                         = "strict"
    true_client_ip_header       = null
    origin_error_page_pass_thru = null
    image_resizing              = null
    proxy_read_timeout          = null
    prefetch_preload            = null
    polish                      = null
  }
}

resource "cloudflare_zone_dnssec" "desmaraisp" {
  zone_id = var.CLOUDFLARE_ZONE_ID
}