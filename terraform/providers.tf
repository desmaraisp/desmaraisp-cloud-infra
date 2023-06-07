terraform {
  cloud {
    organization = "desmaraisp-org"
    workspaces {
      name = "desmaraisp-cloud-infra-workspace"
    }
  }

  required_providers {
    sentry = {
      source = "jianyuan/sentry"
      version = "0.11.2"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "4.52.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.68.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.7.1"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

provider "google-beta" {
  project = var.SHARED_INFRA_PROJECT
  region = "us-east1"
}
provider "cloudflare" {
  api_token = var.CLOUDFLARE_API_TOKEN
}

provider "sentry" {}
