variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}
variable "location" {
  type        = string
  description = "Localização dos recursos"
}
variable "tags" {
  type        = map(string)
  description = "Tags dos recursos"
}
###################################### VNET
variable "vnet_hub_name" {
  description = "The vnet hub name to deploy the resources to"
  type        = string
}
variable "address_space_hub" {
  description = "The address space hub to deploy the resources to"
  type        = list(string)
}
variable "subnet_afw_name" {
  description = "The subnet Azure Firewall name to deploy the resources to"
  type        = string
}
variable "subnet_afw_prefix" {
  description = "The subnet Azure Firewall prefix to deploy the resources to"
  type        = string
}
variable "subnet_vpng_name" {
  description = "The subnet Gateway name to deploy the resources to"
  type        = string
}
variable "subnet_vpng_prefix" {
  description = "The subnet Gateway prefix to deploy the resources to"
  type        = string
}
variable "subnet_bastion_name" {
  description = "The subnet Bastion name to deploy the resources to"
  type        = string
}
variable "subnet_bastion_prefix" {
  description = "The subnet Bastion prefix to deploy the resources to"
  type        = string
}
variable "vnet_spoke_name" {
  description = "The vnet spoke name to deploy the resources to"
  type        = string
}
variable "address_space_spoke" {
  description = "The address space spoke to deploy the resources to"
  type        = list(string)
}
variable "subnet_aks_name" {
  description = "The subnet AKS name to deploy the resources to"
  type        = string
}
variable "subnet_aks_prefix" {
  description = "The subnet AKS prefix to deploy the resources to"
  type        = string
}
variable "subnet_aks_clusteringress_name" {
  description = "The subnet AKS cluster ingress name to deploy the resources to"
  type        = string
}
variable "subnet_aks_clusteringress_prefix" {
  description = "The subnet AKS cluster ingress prefix to deploy the resources to"
  type        = string
}
variable "subnet_aks_agw_name" {
  description = "The subnet AKS Application Gateway name to deploy the resources to"
  type        = string
}
variable "subnet_aks_agw_prefix" {
  description = "The subnet AKS Application Gateway prefix to deploy the resources to"
  type        = string
}
variable "subnet_aks_pl_name" {
  description = "The subnet AKS Private Link name to deploy the resources to"
  type        = string
}
variable "subnet_aks_platform_prefix" {
  description = "The subnet AKS platform prefix to deploy the resources to"
  type        = string
}
variable "peering_hub_to_spoke_name" {
  description = "The peering hub to spoke name to deploy the resources to"
  type        = string
}
variable "peering_spoke_to_hub_name" {
  description = "The peering spoke to hub name to deploy the resources to"
  type        = string
}