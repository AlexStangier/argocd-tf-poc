variable "chart_version" {
  description = "The version of the ArgoCD Helm chart to install"
  type        = string
}

variable "location" {
  description = "The location of the GKE cluster"
  type        = string
}

variable "project_id" {
  description = "The project ID of the GKE cluster"
  type        = string
}

variable "cluster_name" {
  description = "The name of the GKE cluster"
  type        = string
}

variable "cluster_endpoint" {
  description = "The endpoint of the GKE cluster"
  type        = string
}

variable "argocd_password" {
  description = "The password for the ArgoCD admin user"
  type        = string
  sensitive   = true
}

variable "argocd_username" {
  description = "The username for the ArgoCD admin user"
  type        = string
}

variable "cert-manager-version" {
  type        = string
  description = "Cert Manager Software Version"
}

variable "certmanager_cluster_issuer" {
  type        = string
  description = "Cluster Issuer Email"
}
