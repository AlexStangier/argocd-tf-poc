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
    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }

}

data "google_container_cluster" "default" {
  name     = var.cluster_name
  location = var.location
  project  = var.project_id

}

data "google_client_config" "default" {}

provider "kubernetes" {
  host  = "https://${data.google_container_cluster.default.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(
    data.google_container_cluster.default.master_auth[0].cluster_ca_certificate,
  )
}

provider "helm" {
  kubernetes {
    host  = "https://${data.google_container_cluster.default.endpoint}"
    token = data.google_client_config.default.access_token
    cluster_ca_certificate = base64decode(
      data.google_container_cluster.default.master_auth[0].cluster_ca_certificate,
    )
  }
}

provider "argocd" {
  server_addr = "${var.cluster_endpoint}:80"
  username    = var.argocd_username
  password    = var.argocd_password
}
