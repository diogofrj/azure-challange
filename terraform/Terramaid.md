graph TD
    module.aks.azurerm_kubernetes_cluster.aks[azurerm_kubernetes_cluster]
    module.aks.azurerm_kubernetes_cluster_node_pool.user[azurerm_kubernetes_cluster_node_pool]
    module.log_analytics.azurerm_log_analytics_solution.solution[azurerm_log_analytics_solution]
    module.log_analytics.azurerm_log_analytics_workspace.workspace[azurerm_log_analytics_workspace]
    module.network.azurerm_private_dns_zone.dns[azurerm_private_dns_zone]
    module.network.azurerm_private_dns_zone_virtual_network_link.dns_link[azurerm_private_dns_zone_virtual_network_link]
    module.network.azurerm_subnet.internal[azurerm_subnet]
    module.network.azurerm_subnet.mgmt[azurerm_subnet]
    module.network.azurerm_subnet.shared[azurerm_subnet]
    module.network.azurerm_virtual_network.vnet[azurerm_virtual_network]
    module.rg.azurerm_resource_group.rg[azurerm_resource_group]

