module "argocd" {
  source = "./argocd"

  chart_version    = var.chart_version
  location         = var.location
  project_id       = var.project_id
  cluster_name     = var.project_id
  cluster_endpoint = var.cluster_endpoint
  argocd_password  = var.argocd_password
  argocd_username  = var.argocd_username
}

module "certmanager" {
  source = "./certmanager"

  cert-manager-version = var.cert-manager-version
  ClusterIssuer        = var.certmanager_cluster_issuer
}
