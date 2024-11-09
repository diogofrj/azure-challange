#RG
location            = "westus2"
location_short      = "wus2"
resource_group_name = "rg-challenge-wus2-prd"
environment         = "prd"
tags = {
  environment = "Production"
  project     = "Azure Challenge"
  workload    = "Challenge"
  terraform   = "true"
}


#NETWORK HUB
vnet_hub_name         = "vn-hub"
address_space_hub     = ["10.200.0.0/24", "10.210.0.0/16"]
subnet_afw_name       = "AzureFirewallSubnet"
subnet_afw_prefix     = "10.200.0.0/26"
subnet_vpng_name      = "GatewaySubnet"
subnet_vpng_prefix    = "10.200.0.64/27"
subnet_bastion_name   = "AzureBastionSubnet"
subnet_bastion_prefix = "10.200.0.128/26"
subnet_shared_name    = "sn-shared"
subnet_shared_prefix  = "10.210.0.0/24"

#NETWORK SPOKE
vnet_spoke_name                  = "vn-spoke"
address_space_spoke              = ["10.240.0.0/16"]
subnet_aks_name                  = "sn-aks-clusternodes"
subnet_aks_prefix                = "10.240.0.0/22"
subnet_aks_clusteringress_name   = "sn-aks-clusteringress"
subnet_aks_clusteringress_prefix = "10.240.4.0/28"
subnet_aks_agw_name              = "sn-aks-agw"
subnet_aks_agw_prefix            = "10.240.5.0/24"
subnet_aks_pl_name               = "sn-aks-pl"
subnet_aks_platform_prefix       = "10.240.4.32/28"

#PEERING
peering_hub_to_spoke_name = "peer-hub-to-spoke"
peering_spoke_to_hub_name = "peer-spoke-to-hub"

# #FW
# fw_name               = "afw-aks"
# fw_pip_name           = "fw-pip"
# fw_config_name        = "fw-config"
# fw_udr_name           = "udr-fw"
# fw_udr_route_name     = "fw-route"
# fw_udr_route_internet = "fw-internet"
# fw_natrule_name       = "nat-rule"

#AKS
cluster_name = "aks-prod-wus-challenge"
kubernetes_version = "1.30.5"
sku_tier = "Free"

system_node_pool_name = "systempool"
system_node_pool_node_count = 1
system_node_pool_auto_scaling_enabled = true
system_node_pool_os_disk_size_gb = 128
system_node_pool_vm_size = "Standard_D2_v2"
system_node_pool_min_count = 1
system_node_pool_max_count = 2

user_node_pool_name = "userpool"
user_node_pool_auto_scaling_enabled = true
user_node_pool_node_count = 1
user_node_pool_vm_size = "Standard_D2_v2"
user_node_pool_min_count = 1
user_node_pool_max_count = 2

private_cluster_enabled = true
network_plugin = "azure"
network_policy = "calico"
service_mesh_mode = "Istio"
service_mesh_revisions = ["asm-1-23"]
