resource "google_service_account" "default" {
  account_id   = "argocd-service-account-id"
  display_name = "Argo CD Cluster Service Account"
}

resource "google_container_cluster" "argo-cd-cluster" {
  name     = "argo-cluster"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "argocd-node-pool"
  location   = var.region
  cluster    = google_container_cluster.argo-cd-cluster.name
  node_count = 1

  node_config {
    preemptible  = false
    machine_type = "n1-standard-1"
    disk_size_gb = 15

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
