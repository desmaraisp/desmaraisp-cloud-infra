variable "CLOUDFLARE_API_TOKEN" {
  type = string
  sensitive = true
}

variable "CLOUDFLARE_ZONE_ID" {
  type = string
}

variable "CLOUDFLARE_ACCOUNT_ID" {
  type = string
}

variable "SHARED_INFRA_PROJECT" {
  type = string
}

variable "GCP_ROOT_ORG" {
  type = string
}

variable "TFC_RANDOMIZER_WORKSPACE" {
  type = string
}

variable "TFC_RANDOMIZER_PROJECT" {
  type = string
}

variable "TFC_ORGANIZATION" {
  type = string
}