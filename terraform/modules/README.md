## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.8.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 4.8.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | ./modules/aks | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_rg"></a> [rg](#module\_rg) | ./modules/rg | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/4.8.0/docs/data-sources/client_config) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space_hub"></a> [address\_space\_hub](#input\_address\_space\_hub) | The address space hub to deploy the resources to | `list(string)` | n/a | yes |
| <a name="input_address_space_spoke"></a> [address\_space\_spoke](#input\_address\_space\_spoke) | The address space spoke to deploy the resources to | `list(string)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do cluster AKS | `string` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Versão do Kubernetes para o cluster AKS | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure region to deploy the resources to | `string` | n/a | yes |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Plugin de rede do cluster AKS | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Política de rede do cluster AKS | `string` | n/a | yes |
| <a name="input_peering_hub_to_spoke_name"></a> [peering\_hub\_to\_spoke\_name](#input\_peering\_hub\_to\_spoke\_name) | The peering hub to spoke name to deploy the resources to | `string` | n/a | yes |
| <a name="input_peering_spoke_to_hub_name"></a> [peering\_spoke\_to\_hub\_name](#input\_peering\_spoke\_to\_hub\_name) | The peering spoke to hub name to deploy the resources to | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Se o cluster AKS é privado | `bool` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group name to deploy the resources to | `string` | n/a | yes |
| <a name="input_service_mesh_mode"></a> [service\_mesh\_mode](#input\_service\_mesh\_mode) | Modo do service mesh | `string` | n/a | yes |
| <a name="input_service_mesh_revisions"></a> [service\_mesh\_revisions](#input\_service\_mesh\_revisions) | Revisões do service mesh | `list(string)` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | Tier do SKU do cluster AKS | `string` | n/a | yes |
| <a name="input_subnet_afw_name"></a> [subnet\_afw\_name](#input\_subnet\_afw\_name) | The subnet Azure Firewall name to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_afw_prefix"></a> [subnet\_afw\_prefix](#input\_subnet\_afw\_prefix) | The subnet Azure Firewall prefix to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_aks_agw_name"></a> [subnet\_aks\_agw\_name](#input\_subnet\_aks\_agw\_name) | The subnet AKS Application Gateway name to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_aks_agw_prefix"></a> [subnet\_aks\_agw\_prefix](#input\_subnet\_aks\_agw\_prefix) | The subnet AKS Application Gateway prefix to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_aks_clusteringress_name"></a> [subnet\_aks\_clusteringress\_name](#input\_subnet\_aks\_clusteringress\_name) | The subnet AKS cluster ingress name to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_aks_clusteringress_prefix"></a> [subnet\_aks\_clusteringress\_prefix](#input\_subnet\_aks\_clusteringress\_prefix) | The subnet AKS cluster ingress prefix to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_aks_name"></a> [subnet\_aks\_name](#input\_subnet\_aks\_name) | The subnet AKS name to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_aks_pl_name"></a> [subnet\_aks\_pl\_name](#input\_subnet\_aks\_pl\_name) | The subnet AKS Private Link name to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_aks_platform_prefix"></a> [subnet\_aks\_platform\_prefix](#input\_subnet\_aks\_platform\_prefix) | The subnet AKS platform prefix to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_aks_prefix"></a> [subnet\_aks\_prefix](#input\_subnet\_aks\_prefix) | The subnet AKS prefix to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_bastion_name"></a> [subnet\_bastion\_name](#input\_subnet\_bastion\_name) | The subnet Bastion name to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_bastion_prefix"></a> [subnet\_bastion\_prefix](#input\_subnet\_bastion\_prefix) | The subnet Bastion prefix to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_vpng_name"></a> [subnet\_vpng\_name](#input\_subnet\_vpng\_name) | The subnet Gateway name to deploy the resources to | `string` | n/a | yes |
| <a name="input_subnet_vpng_prefix"></a> [subnet\_vpng\_prefix](#input\_subnet\_vpng\_prefix) | The subnet Gateway prefix to deploy the resources to | `string` | n/a | yes |
| <a name="input_system_node_pool_auto_scaling_enabled"></a> [system\_node\_pool\_auto\_scaling\_enabled](#input\_system\_node\_pool\_auto\_scaling\_enabled) | Se o auto scaling está habilitado no node pool do sistema | `bool` | n/a | yes |
| <a name="input_system_node_pool_max_count"></a> [system\_node\_pool\_max\_count](#input\_system\_node\_pool\_max\_count) | Número máximo de nós no node pool do sistema | `number` | n/a | yes |
| <a name="input_system_node_pool_min_count"></a> [system\_node\_pool\_min\_count](#input\_system\_node\_pool\_min\_count) | Número mínimo de nós no node pool do sistema | `number` | n/a | yes |
| <a name="input_system_node_pool_name"></a> [system\_node\_pool\_name](#input\_system\_node\_pool\_name) | Nome do node pool do sistema | `string` | n/a | yes |
| <a name="input_system_node_pool_node_count"></a> [system\_node\_pool\_node\_count](#input\_system\_node\_pool\_node\_count) | Número de nós no node pool do sistema | `number` | n/a | yes |
| <a name="input_system_node_pool_os_disk_size_gb"></a> [system\_node\_pool\_os\_disk\_size\_gb](#input\_system\_node\_pool\_os\_disk\_size\_gb) | Tamanho do disco do node pool do sistema | `number` | n/a | yes |
| <a name="input_system_node_pool_vm_size"></a> [system\_node\_pool\_vm\_size](#input\_system\_node\_pool\_vm\_size) | Tamanho da VM do node pool do sistema | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | <pre>{<br/>  "environment": "Production",<br/>  "project": "Azure Challenge",<br/>  "terraform": "true",<br/>  "workload": "Challenge"<br/>}</pre> | no |
| <a name="input_user_node_pool_auto_scaling_enabled"></a> [user\_node\_pool\_auto\_scaling\_enabled](#input\_user\_node\_pool\_auto\_scaling\_enabled) | Se o auto scaling está habilitado no node pool de usuário | `bool` | n/a | yes |
| <a name="input_user_node_pool_max_count"></a> [user\_node\_pool\_max\_count](#input\_user\_node\_pool\_max\_count) | Número máximo de nós no node pool de usuário | `number` | n/a | yes |
| <a name="input_user_node_pool_min_count"></a> [user\_node\_pool\_min\_count](#input\_user\_node\_pool\_min\_count) | Número mínimo de nós no node pool de usuário | `number` | n/a | yes |
| <a name="input_user_node_pool_name"></a> [user\_node\_pool\_name](#input\_user\_node\_pool\_name) | Nome do node pool de usuário | `string` | n/a | yes |
| <a name="input_user_node_pool_node_count"></a> [user\_node\_pool\_node\_count](#input\_user\_node\_pool\_node\_count) | Número de nós no node pool de usuário | `number` | n/a | yes |
| <a name="input_user_node_pool_vm_size"></a> [user\_node\_pool\_vm\_size](#input\_user\_node\_pool\_vm\_size) | Tamanho da VM do node pool de usuário | `string` | n/a | yes |
| <a name="input_vnet_hub_name"></a> [vnet\_hub\_name](#input\_vnet\_hub\_name) | The vnet hub name to deploy the resources to | `string` | n/a | yes |
| <a name="input_vnet_spoke_name"></a> [vnet\_spoke\_name](#input\_vnet\_spoke\_name) | The vnet spoke name to deploy the resources to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
