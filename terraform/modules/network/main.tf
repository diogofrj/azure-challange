resource "azurerm_virtual_network" "vnet_hub" {
  name                = var.vnet_hub_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space_hub
  tags                = var.tags

  dns_servers = []
}

resource "azurerm_virtual_network" "vnet_spoke" {
  name                = var.vnet_spoke_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space_spoke
  tags                = var.tags

  dns_servers = []
}

# Subnet Azure Firewall
resource "azurerm_subnet" "subnet_afw" {
  name                 = var.subnet_afw_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_hub.name
  address_prefixes     = [var.subnet_afw_prefix]
}

# Subnet Gateway
resource "azurerm_subnet" "subnet_vpng" {
  name                 = var.subnet_vpng_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_hub.name
  address_prefixes     = [var.subnet_vpng_prefix]
}

# Subnet Bastion
resource "azurerm_subnet" "subnet_bastion" {
  name                 = var.subnet_bastion_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_hub.name
  address_prefixes     = [var.subnet_bastion_prefix]
}



# Subnet AKS Nodes
resource "azurerm_subnet" "subnet_aks" {
  name                 = var.subnet_aks_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_spoke.name
  address_prefixes     = [var.subnet_aks_prefix]

  service_endpoints = ["Microsoft.KeyVault", "Microsoft.Storage"]

  delegation {
    name = "aks-delegation"
    service_delegation {
      name = "Microsoft.ContainerService/managedClusters"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}

# Subnet AKS Cluster Ingress
resource "azurerm_subnet" "subnet_aks_clusteringress" {
  name                 = var.subnet_aks_clusteringress_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_spoke.name
  address_prefixes     = [var.subnet_aks_clusteringress_prefix]
}

# Subnet AKS Application Gateway
resource "azurerm_subnet" "subnet_aks_agw" {
  name                 = var.subnet_aks_agw_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_spoke.name
  address_prefixes     = [var.subnet_aks_agw_prefix]
}

# Subnet AKS Private Link
resource "azurerm_subnet" "subnet_aks_pl" {
  name                 = var.subnet_aks_pl_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_spoke.name
  address_prefixes     = [var.subnet_aks_platform_prefix]
}

# Peering Hub to Spoke
resource "azurerm_virtual_network_peering" "hub_to_spoke" {
  name                      = var.peering_hub_to_spoke_name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet_hub.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_spoke.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
}

# Peering Spoke to Hub  
resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                      = var.peering_spoke_to_hub_name
  resource_group_name       = var.resource_group_name
  virtual_network_name      = azurerm_virtual_network.vnet_spoke.name
  remote_virtual_network_id = azurerm_virtual_network.vnet_hub.id
  allow_forwarded_traffic   = true
  allow_gateway_transit     = false
  use_remote_gateways       = false
}
