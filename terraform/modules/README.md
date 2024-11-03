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
| <a name="module_rg"></a> [rg](#module\_rg) | ./modules/rg | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Address space da VNet | `list(string)` | n/a | yes |
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | Client ID | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | Client Secret | `string` | n/a | yes |
| <a name="input_dns_zone_name"></a> [dns\_zone\_name](#input\_dns\_zone\_name) | Nome da zona DNS privada | `string` | n/a | yes |
| <a name="input_dns_zone_tags"></a> [dns\_zone\_tags](#input\_dns\_zone\_tags) | Tags para os recursos | `map(string)` | `{}` | no |
| <a name="input_inbound_subnet_prefix"></a> [inbound\_subnet\_prefix](#input\_inbound\_subnet\_prefix) | CIDR da subnet de inbound | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Localização dos recursos | `string` | n/a | yes |
| <a name="input_mgmt_subnet_prefix"></a> [mgmt\_subnet\_prefix](#input\_mgmt\_subnet\_prefix) | CIDR da subnet de gerenciamento | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Nome do Resource Group | `string` | n/a | yes |
| <a name="input_shared_subnet_prefix"></a> [shared\_subnet\_prefix](#input\_shared\_subnet\_prefix) | CIDR da subnet compartilhada | `string` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Subscription ID | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags para os recursos | `map(string)` | `{}` | no |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Tenant ID | `string` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da Virtual Network | `string` | n/a | yes |

## Outputs

No outputs.
