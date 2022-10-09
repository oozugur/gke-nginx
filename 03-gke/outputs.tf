output "kubernetes_cluster_name" {
  value = var.names.cluster_name
}
output "region" {
  value = var.region
}
output "project_id" {
  value = var.project
}
output "zone" {
  value = var.zone
}
output "kubernetes_cluster_host" {
  value     = module.gke.endpoint
  sensitive = true
}
