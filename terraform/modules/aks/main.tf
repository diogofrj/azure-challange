locals {
  cluster_name = "aks-${var.environment}-${var.location_short}-${var.workload}"
  node_rg     = "rg-${var.environment}-${var.location_short}-${var.workload}-node"
}

# Primeiro, criar a identidade gerenciada
resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "id-${local.cluster_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# Dar permissão para a identidade gerenciar o DNS
resource "azurerm_role_assignment" "dns_contributor" {
  scope                = var.private_dns_zone_id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.aks_identity.principal_id
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = local.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = local.cluster_name
  node_resource_group = local.node_rg

  default_node_pool {
    name                = "systempool"
    # enable_auto_scaling = true
    vm_size             = var.system_node_pool_vm_size
    # min_count          = var.system_node_pool_min_count
    # max_count          = var.system_node_pool_max_count
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
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_identity.id]
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
  node_count          = var.user_node_pool_min_count
  min_count          = var.user_node_pool_min_count 
  max_count          = var.user_node_pool_max_count
  vnet_subnet_id     = var.subnet_id
  os_disk_type       = "Ephemeral"
  os_sku             = "AzureLinux"
  mode               = "User"
  max_pods           = 100
  eviction_policy    = "Delete"
  upgrade_settings {
    max_surge = "1"
  }
  
  tags = merge(var.tags, {
    "nodepool-type" = "user"
    "environment"   = var.environment
    "app"           = "user-apps"
  })

}
