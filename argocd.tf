/**
  * https://medium.com/@anjkeesari/install-argocd-in-aks-with-helm-chart-using-terraform-327b0dabd555
**/

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
  namespace  = kubernetes_namespace.argocd_namespace.metadata.0.name
  depends_on = [
    kubernetes_namespace.argocd_namespace
  ]

  set {
    name = "redis-ha.enabled"
    value = false
  }

  set {
    name  = "server.autoscaling.enabled"
    value = false
  }

  set {
    name = "server.autoscaling.minReplicas"
    value = 1
  }

  set {
    name = "repoServer.autoscaling.enabled"
    value = false
  }

  set {
    name = "repoServer.autoscaling.minReplicas"
    value = 1
  }

  set {
    name = "applicationSet.replicas"
    value = 1
  }
}
