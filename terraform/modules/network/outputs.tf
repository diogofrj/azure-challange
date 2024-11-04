output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID da Virtual Network"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Nome da Virtual Network"
}

output "shared_subnet_id" {
  value       = azurerm_subnet.shared.id
  description = "ID da Subnet Shared"
}

output "internal_subnet_id" {
  value       = azurerm_subnet.internal.id
  description = "ID da Subnet Internal"
}

output "mgmt_subnet_id" {
  value       = azurerm_subnet.mgmt.id
  description = "ID da Subnet Management"
}

output "private_dns_zone_id" {
  value       = azurerm_private_dns_zone.dns.id
  description = "ID da Zona DNS Privada"
}
