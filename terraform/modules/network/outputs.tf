output "vnet_hub_id" {
  value       = azurerm_virtual_network.vnet_hub.id
  description = "ID da Virtual Network Hub"
}

output "vnet_hub_name" {
  value       = azurerm_virtual_network.vnet_hub.name
  description = "Nome da Virtual Network Hub"
}

output "vnet_spoke_id" {
  value       = azurerm_virtual_network.vnet_spoke.id
  description = "ID da Virtual Network Spoke"
}

output "vnet_spoke_name" {
  value       = azurerm_virtual_network.vnet_spoke.name
  description = "Nome da Virtual Network Spoke"
}

output "subnet_afw_id" {
  value       = azurerm_subnet.subnet_afw.id
  description = "ID da Subnet Azure Firewall"
}

output "subnet_vpng_id" {
  value       = azurerm_subnet.subnet_vpng.id
  description = "ID da Subnet Gateway"
}

output "subnet_bastion_id" {
  value       = azurerm_subnet.subnet_bastion.id
  description = "ID da Subnet Bastion"
}

output "subnet_aks_id" {
  value       = azurerm_subnet.subnet_aks.id
  description = "ID da Subnet AKS"
}

output "subnet_aks_clusteringress_id" {
  value       = azurerm_subnet.subnet_aks_clusteringress.id
  description = "ID da Subnet AKS Cluster Ingress"
}

output "subnet_aks_agw_id" {
  value       = azurerm_subnet.subnet_aks_agw.id
  description = "ID da Subnet AKS Application Gateway"
}

output "subnet_aks_pl_id" {
  value       = azurerm_subnet.subnet_aks_pl.id
  description = "ID da Subnet AKS Private Link"
}
