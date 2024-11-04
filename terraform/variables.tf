variable "location" {
  description = "Localização dos recursos"
  type        = string
}

variable "location_short" {
  description = "Abreviação da localização"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
}

variable "workload" {
  description = "Nome do workload/projeto"
  type        = string
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
}

variable "vnet_name" {
  description = "Nome da Virtual Network"
  type        = string
}

variable "address_space" {
  description = "Address space da VNet"
  type        = list(string)
}

variable "shared_subnet_prefix" {
  description = "CIDR da subnet compartilhada"
  type        = string
}

variable "internal_subnet_prefix" {
  description = "CIDR da subnet interna"
  type        = string
}

variable "mgmt_subnet_prefix" {
  description = "CIDR da subnet de gerenciamento"
  type        = string
}

variable "dns_zone_name" {
  description = "Nome da zona DNS privada"
  type        = string
}



variable "service_cidr" {
  description = "CIDR para serviços do Kubernetes"
  type        = string
}

variable "dns_service_ip" {
  description = "IP do serviço DNS do Kubernetes"
  type        = string
}

variable "docker_bridge_cidr" {
  description = "CIDR para docker bridge"
  type        = string
}

variable "system_node_pool_vm_size" {
  description = "Tamanho das VMs do system node pool"
  type        = string
}

variable "user_node_pool_vm_size" {
  description = "Tamanho das VMs do user node pool"
  type        = string
}

variable "system_node_pool_min_count" {
  description = "Número mínimo de nodes no system pool"
  type        = number
}

variable "system_node_pool_max_count" {
  description = "Número máximo de nodes no system pool"
  type        = number
}

variable "user_node_pool_min_count" {
  description = "Número mínimo de nodes no user pool"
  type        = number
}

variable "user_node_pool_max_count" {
  description = "Número máximo de nodes no user pool"
  type        = number
}

variable "retention_in_days" {
  description = "Dias de retenção dos logs"
  type        = number
  default     = 30
}

variable "auto_scaling_enabled" {
  description = "Habilita o auto scaling"
  type        = bool
  default     = true
}
