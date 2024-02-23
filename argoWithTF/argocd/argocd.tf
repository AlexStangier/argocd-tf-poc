resource "kubernetes_namespace" "argocd_namespace" {
  metadata {
    name = "argocd"
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.chart_version
  namespace  = kubernetes_namespace.argocd_namespace.metadata[0].name
  depends_on = [
    kubernetes_namespace.argocd_namespace
  ]

  //TODO: remove before release
  set {
    name  = "crds.keep"
    value = false
  }

  // HA & Scaling
  set {
    name  = "redis-ha.enabled"
    value = false
  }

  set {
    name  = "server.autoscaling.enabled"
    value = false
  }

  set {
    name  = "server.autoscaling.minReplicas"
    value = 1
  }

  set {
    name  = "repoServer.autoscaling.enabled"
    value = false
  }

  set {
    name  = "repoServer.autoscaling.minReplicas"
    value = 1
  }

  set {
    name  = "applicationSet.replicas"
    value = 1
  }
}

resource "argocd_repository" "argocd_example_apps" {
  repo = "git@github.com:AlexStangier/argocd-example-apps.git"

  depends_on = [ helm_release.argocd ]
}
