data "azurerm_client_config" "current" {
}
output "account_id" {
  value = data.azurerm_client_config.current.client_id
}
module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "network" {
  source                           = "./modules/network"
  resource_group_name              = module.rg.resource_group_name
  location                         = module.rg.resource_group_location
  vnet_hub_name                    = var.vnet_hub_name
  address_space_hub                = var.address_space_hub
  subnet_afw_name                  = var.subnet_afw_name
  subnet_afw_prefix                = var.subnet_afw_prefix
  subnet_vpng_name                 = var.subnet_vpng_name
  subnet_vpng_prefix               = var.subnet_vpng_prefix
  subnet_bastion_name              = var.subnet_bastion_name
  subnet_bastion_prefix            = var.subnet_bastion_prefix
  vnet_spoke_name                  = var.vnet_spoke_name
  address_space_spoke              = var.address_space_spoke
  subnet_aks_name                  = var.subnet_aks_name
  subnet_aks_prefix                = var.subnet_aks_prefix
  subnet_aks_clusteringress_name   = var.subnet_aks_clusteringress_name
  subnet_aks_clusteringress_prefix = var.subnet_aks_clusteringress_prefix
  subnet_aks_agw_name              = var.subnet_aks_agw_name
  subnet_aks_agw_prefix            = var.subnet_aks_agw_prefix
  subnet_aks_pl_name               = var.subnet_aks_pl_name
  subnet_aks_platform_prefix       = var.subnet_aks_platform_prefix
  peering_hub_to_spoke_name        = var.peering_hub_to_spoke_name
  peering_spoke_to_hub_name        = var.peering_spoke_to_hub_name
  tags                             = var.tags
}

module "aks" {
  source                     = "./modules/aks"
  resource_group_name                    = module.rg.resource_group_name
  location                              = module.rg.resource_group_location
  cluster_name                          = var.cluster_name
  kubernetes_version                    = var.kubernetes_version
  sku_tier                             = var.sku_tier
  system_node_pool_name                = var.system_node_pool_name
  system_node_pool_node_count          = var.system_node_pool_node_count
  system_node_pool_auto_scaling_enabled = var.system_node_pool_auto_scaling_enabled
  system_node_pool_os_disk_size_gb     = var.system_node_pool_os_disk_size_gb
  system_node_pool_vm_size             = var.system_node_pool_vm_size
  system_node_pool_min_count           = var.system_node_pool_min_count
  system_node_pool_max_count           = var.system_node_pool_max_count
  user_node_pool_name                  = var.user_node_pool_name
  user_node_pool_auto_scaling_enabled  = var.user_node_pool_auto_scaling_enabled
  user_node_pool_node_count            = var.user_node_pool_node_count
  user_node_pool_vm_size              = var.user_node_pool_vm_size
  user_node_pool_min_count            = var.user_node_pool_min_count
  user_node_pool_max_count            = var.user_node_pool_max_count
  private_cluster_enabled             = var.private_cluster_enabled
  network_plugin                      = var.network_plugin
  network_policy                      = var.network_policy
  service_mesh_mode                   = var.service_mesh_mode
  service_mesh_revisions              = var.service_mesh_revisions
  tags                               = var.tags
}
