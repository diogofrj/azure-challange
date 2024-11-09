resource "azurerm_private_dns_zone" "aks" {
  name                = "privatelink.${var.location}.azmk8s.io"
  resource_group_name = var.resource_group_name
}

resource "azurerm_user_assigned_identity" "aks" {
  name                = "aks-identity"
  resource_group_name = var.resource_group_name
  location            = var.location
}

resource "azurerm_role_assignment" "aks" {
  scope                = azurerm_private_dns_zone.aks.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.aks.principal_id
}


resource "azurerm_kubernetes_cluster" "aks" {
  name                    = var.cluster_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = "${var.cluster_name}-k8s"
  kubernetes_version      = var.kubernetes_version
  private_cluster_enabled = var.private_cluster_enabled
  private_dns_zone_id     = azurerm_private_dns_zone.aks.id

  sku_tier                = var.sku_tier
  node_resource_group     = "${var.resource_group_name}-aks-infra"

  default_node_pool {
    name            = var.system_node_pool_name
    node_count      = var.system_node_pool_node_count
    vm_size         = var.system_node_pool_vm_size
    os_disk_size_gb = var.system_node_pool_os_disk_size_gb
    type            = "VirtualMachineScaleSets"
    auto_scaling_enabled = var.system_node_pool_auto_scaling_enabled
    min_count       = var.system_node_pool_min_count
    max_count       = var.system_node_pool_max_count

  }
  automatic_upgrade_channel = "stable"
  maintenance_window {
    allowed {
      day   = "Sunday"
      hours = [2]
    }
  }
  network_profile {
    network_plugin = var.network_plugin
    network_policy = var.network_policy

  }
  service_mesh_profile {
    mode      = var.service_mesh_mode
    revisions = var.service_mesh_revisions
  }

  identity {
    type = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks.id]
  }


  role_based_access_control_enabled = true

  tags = var.tags

  lifecycle {
    ignore_changes = [
      default_node_pool[0].node_count
    ]
  }
  depends_on = [azurerm_user_assigned_identity.aks, azurerm_role_assignment.aks]
}


resource "azurerm_kubernetes_cluster_node_pool" "userpool" {
  name                  = var.user_node_pool_name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = var.user_node_pool_vm_size
  auto_scaling_enabled  = var.user_node_pool_auto_scaling_enabled
  node_count            = var.user_node_pool_node_count
  min_count             = var.user_node_pool_min_count
  max_count             = var.user_node_pool_max_count
  tags                  = var.tags
  depends_on = [azurerm_user_assigned_identity.aks, azurerm_role_assignment.aks]
}
