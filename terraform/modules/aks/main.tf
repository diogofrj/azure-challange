locals {
  cluster_name = "aks-${var.environment}-${var.location_short}-${var.workload}"
  node_rg     = "rg-${var.environment}-${var.location_short}-${var.workload}-node"
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = local.cluster_name
  kubernetes_version  = var.kubernetes_version
  node_resource_group = local.node_rg

  default_node_pool {
    name                = "systempool"
    vm_size             = var.system_node_pool_vm_size
    min_count          = var.system_node_pool_min_count
    max_count          = var.system_node_pool_max_count
    vnet_subnet_id     = var.subnet_id
    os_disk_type       = "Ephemeral"
    os_sku             = "AzureLinux"
    
    tags = {
      "nodepool-type" = "system"
      "environment"   = var.environment
      "app"           = "system-apps"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin     = "azure"
    network_policy     = "calico"
    load_balancer_sku  = "standard"
    service_cidr       = var.service_cidr
    dns_service_ip     = var.dns_service_ip
  }

  private_cluster_enabled = true
  private_dns_zone_id    = var.private_dns_zone_id

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "user" {
  name                = "userpool"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size             = var.user_node_pool_vm_size
  min_count          = var.user_node_pool_min_count
  max_count          = var.user_node_pool_max_count
  vnet_subnet_id     = var.subnet_id
  os_disk_type       = "Ephemeral"
  os_sku             = "AzureLinux"
  
  tags = merge(var.tags, {
    "nodepool-type" = "user"
    "environment"   = var.environment
    "app"           = "user-apps"
  })

}
