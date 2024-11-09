variable "tags" {
  type = map(string)
  default = {
    environment = "Production"
    project     = "Azure Challenge"
    workload    = "Challenge"
    terraform   = "true"
  }
}
variable "location" {
  description = "The Azure region to deploy the resources to"
  type        = string
}
# variable "location_short" {
#   description = "The Azure region to deploy the resources to"
#   type        = string
# }

# variable "environment" {
#   description = "The environment to deploy the resources to"
#   type        = string
# }
# variable "workload" {
#   description = "The workload to deploy the resources to"
#   type        = string
# }
variable "resource_group_name" {
  description = "The resource group name to deploy the resources to"
  type        = string
}
####################################### VNET
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
####################################### FW
# variable "fw_name" {
#   description = "The fw name to deploy the resources to"
#   type        = string
# }
# variable "fw_pip_name" {
#   description = "The fw pip name to deploy the resources to"
#   type        = string
# }
# variable "fw_config_name" {
#   description = "The fw config name to deploy the resources to"
#   type        = string
# }
# variable "fw_udr_name" {
#   description = "The fw udr name to deploy the resources to"
#   type        = string
# }
# variable "fw_udr_route_name" {
#   description = "The fw udr route name to deploy the resources to"
#   type        = string
# }
# variable "fw_udr_route_internet" {
#   description = "The fw udr route internet to deploy the resources to"
#   type        = string
# }
# variable "fw_natrule_name" {
#   description = "The fw natrule name to deploy the resources to"
#   type        = string
# }
# ####################################### AKS
variable "cluster_name" {
  description = "Nome do cluster AKS"
  type        = string
}

variable "kubernetes_version" {
  description = "Versão do Kubernetes para o cluster AKS"
  type        = string
}

variable "sku_tier" {
  description = "Tier do SKU do cluster AKS"
  type        = string
}

variable "system_node_pool_name" {
  description = "Nome do node pool do sistema"
  type        = string
}
variable "system_node_pool_node_count" {
  description = "Número de nós no node pool do sistema"
  type        = number
}
variable "system_node_pool_auto_scaling_enabled" {
  description = "Se o auto scaling está habilitado no node pool do sistema"
  type        = bool
}
variable "system_node_pool_os_disk_size_gb" {
  description = "Tamanho do disco do node pool do sistema"
  type        = number
}

variable "system_node_pool_vm_size" {
  description = "Tamanho da VM do node pool do sistema"
  type        = string
}

variable "system_node_pool_min_count" {
  description = "Número mínimo de nós no node pool do sistema"
  type        = number
}

variable "system_node_pool_max_count" {
  description = "Número máximo de nós no node pool do sistema"
  type        = number
}

variable "user_node_pool_name" {
  description = "Nome do node pool de usuário"
  type        = string
}
variable "user_node_pool_auto_scaling_enabled" {
  description = "Se o auto scaling está habilitado no node pool de usuário"
  type        = bool
}
variable "user_node_pool_node_count" {
  description = "Número de nós no node pool de usuário"
  type        = number
}
variable "user_node_pool_vm_size" {
  description = "Tamanho da VM do node pool de usuário"
  type        = string
}

variable "user_node_pool_min_count" {
  description = "Número mínimo de nós no node pool de usuário"
  type        = number
}

variable "user_node_pool_max_count" {
  description = "Número máximo de nós no node pool de usuário"
  type        = number
}
variable "private_cluster_enabled" {
  description = "Se o cluster AKS é privado"
  type        = bool
}
variable "network_plugin" {
  description = "Plugin de rede do cluster AKS"
  type        = string
}
variable "network_policy" {
  description = "Política de rede do cluster AKS"
  type        = string
}
variable "service_mesh_mode" {
  description = "Modo do service mesh"
  type        = string
}
variable "service_mesh_revisions" {
  description = "Revisões do service mesh"
  type        = list(string)
}