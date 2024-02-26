terraform {
  required_version = "~> 1.7.1"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.16.0"
    }
  }
}

provider "google" {
  project = var.project
}
  
# gcloud container clusters get-credentials argo-cluster --zone europe-west1-b --project cw-academy-sandbox-alex