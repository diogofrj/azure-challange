module "rg" {
  source              = "./modules/rg"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

module "network" {
  source                = "./modules/network"
  resource_group_name   = module.rg.resource_group_name
  location             = var.location
  vnet_name            = var.vnet_name
  address_space        = var.address_space
  shared_subnet_prefix = var.shared_subnet_prefix
  internal_subnet_prefix = var.internal_subnet_prefix
  mgmt_subnet_prefix   = var.mgmt_subnet_prefix
  dns_zone_name        = var.dns_zone_name
  tags                 = var.tags
}

module "log_analytics" {
  source              = "./modules/log_analytics"
  resource_group_name = module.rg.resource_group_name
  location            = var.location
  environment         = var.environment
  location_short      = var.location_short
  workload            = var.workload
  retention_in_days   = var.retention_in_days
  tags                = var.tags
}

module "aks" {
  source                     = "./modules/aks"
  resource_group_name        = module.rg.resource_group_name
  location                   = var.location
  environment               = var.environment
  location_short            = var.location_short
  workload                  = var.workload
  kubernetes_version        = var.kubernetes_version
  subnet_id                 = module.network.internal_subnet_id
  service_cidr              = var.service_cidr
  dns_service_ip            = var.dns_service_ip
  docker_bridge_cidr        = var.docker_bridge_cidr
  system_node_pool_vm_size  = var.system_node_pool_vm_size
  user_node_pool_vm_size    = var.user_node_pool_vm_size
  system_node_pool_min_count = var.system_node_pool_min_count
  system_node_pool_max_count = var.system_node_pool_max_count
  user_node_pool_min_count   = var.user_node_pool_min_count
  user_node_pool_max_count   = var.user_node_pool_max_count
  private_dns_zone_id       = module.network.private_dns_zone_id
  log_analytics_workspace_id = module.log_analytics.workspace_id
  tags                      = var.tags
}
