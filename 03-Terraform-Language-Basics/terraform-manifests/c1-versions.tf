# Terraform Settings Block
terraform {
  required_version = "~> 1.15.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 7.31.0"
    }
  }
}

# Terraform Provider Block
provider "google" {
  project = "quality-jawfish-815045"
  region  = "europe-north1"
}
