## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 4.8.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks"></a> [aks](#module\_aks) | ./modules/aks | n/a |
| <a name="module_log_analytics"></a> [log\_analytics](#module\_log\_analytics) | ./modules/log_analytics | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |
| <a name="module_rg"></a> [rg](#module\_rg) | ./modules/rg | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Address space da VNet | `list(string)` | n/a | yes |
| <a name="input_dns_service_ip"></a> [dns\_service\_ip](#input\_dns\_service\_ip) | IP do serviço DNS do Kubernetes | `string` | n/a | yes |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | Nome da zona DNS privada | `string` | n/a | yes |
| <a name="input_docker_bridge_cidr"></a> [docker\_bridge\_cidr](#input\_docker\_bridge\_cidr) | CIDR para docker bridge | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Ambiente (dev, staging, prod) | `string` | n/a | yes |
| <a name="input_internal_subnet_prefix"></a> [internal\_subnet\_prefix](#input\_internal\_subnet\_prefix) | CIDR da subnet interna | `string` | n/a | yes |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Versão do Kubernetes | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Localização dos recursos | `string` | n/a | yes |
| <a name="input_location_short"></a> [location\_short](#input\_location\_short) | Abreviação da localização | `string` | n/a | yes |
| <a name="input_mgmt_subnet_prefix"></a> [mgmt\_subnet\_prefix](#input\_mgmt\_subnet\_prefix) | CIDR da subnet de gerenciamento | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Nome do Resource Group | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Dias de retenção dos logs | `number` | `30` | no |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | CIDR para serviços do Kubernetes | `string` | n/a | yes |
| <a name="input_shared_subnet_prefix"></a> [shared\_subnet\_prefix](#input\_shared\_subnet\_prefix) | CIDR da subnet compartilhada | `string` | n/a | yes |
| <a name="input_system_node_pool_max_count"></a> [system\_node\_pool\_max\_count](#input\_system\_node\_pool\_max\_count) | Número máximo de nodes no system pool | `number` | n/a | yes |
| <a name="input_system_node_pool_min_count"></a> [system\_node\_pool\_min\_count](#input\_system\_node\_pool\_min\_count) | Número mínimo de nodes no system pool | `number` | n/a | yes |
| <a name="input_system_node_pool_vm_size"></a> [system\_node\_pool\_vm\_size](#input\_system\_node\_pool\_vm\_size) | Tamanho das VMs do system node pool | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags para os recursos | `map(string)` | `{}` | no |
| <a name="input_user_node_pool_max_count"></a> [user\_node\_pool\_max\_count](#input\_user\_node\_pool\_max\_count) | Número máximo de nodes no user pool | `number` | n/a | yes |
| <a name="input_user_node_pool_min_count"></a> [user\_node\_pool\_min\_count](#input\_user\_node\_pool\_min\_count) | Número mínimo de nodes no user pool | `number` | n/a | yes |
| <a name="input_user_node_pool_vm_size"></a> [user\_node\_pool\_vm\_size](#input\_user\_node\_pool\_vm\_size) | Tamanho das VMs do user node pool | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da Virtual Network | `string` | n/a | yes |
| <a name="input_workload"></a> [workload](#input\_workload) | Nome do workload/projeto | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_cluster_name"></a> [aks\_cluster\_name](#output\_aks\_cluster\_name) | Nome do Cluster AKS |
| <a name="output_aks_node_resource_group"></a> [aks\_node\_resource\_group](#output\_aks\_node\_resource\_group) | Resource Group dos Nodes do AKS |
| <a name="output_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#output\_log\_analytics\_workspace\_name) | Nome do Workspace do Log Analytics |
| <a name="output_resource_group_location"></a> [resource\_group\_location](#output\_resource\_group\_location) | Resource Group Location |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Resource Group Name |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | Nome da Virtual Network |

## Diagrama de Infraestrutura

O diagrama abaixo representa a infraestrutura atual do projeto:

```mermaid
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

```
