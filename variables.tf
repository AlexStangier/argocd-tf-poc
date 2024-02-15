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

