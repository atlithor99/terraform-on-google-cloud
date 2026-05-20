# Terraform Settings Block
terraform {
  required_version = ">= 1.8"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 5.34.0"
    }
  }
}

# Terraform Provider Block
provider "google" {
  project = "quality-jawfish-815045"
  region  = "europe-north1"
}

