terraform {
  required_providers {
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
  region = "us-central1"
}
provider "cloudflare" {
  email   = "philippe.desmarais4@gmail.com"
  api_key = var.CLOUDFLARE_API_TOKEN
}
