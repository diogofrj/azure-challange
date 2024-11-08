
variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "location" {
  type        = string
  description = "Localização dos recursos"
}
variable "vnet_name" {
  type        = string
  description = "Nome da Virtual Network"
}

variable "address_space" {
  type        = list(string)
  description = "Address space da VNet"
}

variable "shared_subnet_prefix" {
  type        = string
  description = "CIDR da subnet compartilhada"
}

variable "internal_subnet_prefix" {
  type        = string
  description = "CIDR da subnet interna"
}

variable "mgmt_subnet_prefix" {
  type        = string
  description = "CIDR da subnet de gerenciamento"
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