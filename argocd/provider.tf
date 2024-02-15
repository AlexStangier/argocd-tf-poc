terraform {
  required_version = "~> 1.7.1"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.16.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.2"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.12.1"
    }
    argocd = {
      source  = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}
