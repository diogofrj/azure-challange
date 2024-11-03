variable "subscription_id" {
  type        = string
  description = "Subscription ID"
}

variable "tenant_id" {
  type        = string
  description = "Tenant ID"
}

variable "client_id" {
  type        = string
  description = "Client ID"
}

variable "client_secret" {
  type        = string
  description = "Client Secret"
}
###### SHARED ###########

variable "vnet_name" {
  type        = string
  description = "Nome da Virtual Network"
}

variable "location" {
  type        = string
  description = "Localização dos recursos"
}

variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "address_space" {
  type        = list(string)
  description = "Address space da VNet"
}

variable "shared_subnet_prefix" {
  type        = string
  description = "CIDR da subnet compartilhada"
}

variable "inbound_subnet_prefix" {
  type        = string
  description = "CIDR da subnet de inbound"
}

variable "mgmt_subnet_prefix" {
  type        = string
  description = "CIDR da subnet de gerenciamento"
}
variable "dns_zone_tags" {
  type        = map(string)
  description = "Tags para os recursos"
  default     = {}
}

variable "dns_zone_name" {
  type        = string
  description = "Nome da zona DNS privada"
}

variable "tags" {
  type        = map(string)
  description = "Tags para os recursos"
  default     = {}
}