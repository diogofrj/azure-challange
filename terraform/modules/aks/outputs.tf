output "cluster_id" {
  value       = azurerm_kubernetes_cluster.aks.id
  description = "ID do Cluster AKS"
}

output "cluster_name" {
  value       = azurerm_kubernetes_cluster.aks.name
  description = "Nome do Cluster AKS"
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive   = true
  description = "Kubeconfig do Cluster"
}

output "node_resource_group" {
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
  description = "Nome do Resource Group dos Nodes"
}
