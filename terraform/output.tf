# output "resource_group_name" {
#   value       = module.rg.resource_group_name
#   description = "Resource Group Name"
# }

# output "resource_group_location" {
#   value       = module.rg.resource_group_location
#   description = "Resource Group Location"
# }

# output "aks_cluster_name" {
#   value       = module.aks.cluster_name
#   description = "Nome do Cluster AKS"
# }

# output "aks_node_resource_group" {
#   value       = module.aks.node_resource_group
#   description = "Resource Group dos Nodes do AKS"
# }

# output "vnet_name" {
#   value       = module.network.vnet_name
#   description = "Nome da Virtual Network"
# }

# output "log_analytics_workspace_name" {
#   value       = module.log_analytics.workspace_name
#   description = "Nome do Workspace do Log Analytics"
# }

output "client_certificate" {
  value     = module.aks.client_certificate
  sensitive = true
}

output "kube_config" {
  value = module.aks.kube_config
  sensitive = true
}
output "aks_get_credentials_command" {
  value = "az aks get-credentials --resource-group ${var.resource_group_name} --name ${var.cluster_name}"
  description = "Comando para obter as credenciais do cluster AKS"
}
