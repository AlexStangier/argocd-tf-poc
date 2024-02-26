output "cluster_connect_string" {
  description = "gcloud kubernetes get credentials command"
  value       = "gcloud container clusters get-credentials ${var.cluster_name} --zone ${var.region} --project ${var.project}"
}
