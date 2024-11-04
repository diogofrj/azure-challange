variable "environment" {
  type        = string
  description = "Ambiente (dev, prod, etc)"
}

variable "location" {
  type        = string
  description = "Localização do AKS"
}

variable "location_short" {
  type        = string
  description = "Código curto da localização (ex: wus para westus)"
}

variable "workload" {
  type        = string
  description = "Nome da carga de trabalho"
}

variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "kubernetes_version" {
  type        = string
  description = "Versão do Kubernetes"
  default     = "1.27.7"
}

variable "subnet_id" {
  type        = string
  description = "ID da subnet para o AKS"
}

variable "service_cidr" {
  type        = string
  description = "CIDR para serviços do Kubernetes"
  default     = "172.16.0.0/16"
}

variable "dns_service_ip" {
  type        = string
  description = "IP do serviço DNS do Kubernetes"
  default     = "172.16.0.10"
}

variable "docker_bridge_cidr" {
  type        = string
  description = "CIDR para docker bridge"
  default     = "172.17.0.1/16"
}

variable "system_node_pool_vm_size" {
  type        = string
  description = "Tamanho da VM para system pool"
  default     = "Standard_D2s_v3"
}

variable "user_node_pool_vm_size" {
  type        = string
  description = "Tamanho da VM para user pool"
  default     = "Standard_D4s_v3"
}

variable "system_node_pool_min_count" {
  type        = number
  default     = 1
}

variable "system_node_pool_max_count" {
  type        = number
  default     = 3
}

variable "user_node_pool_min_count" {
  type        = number
  default     = 1
}

variable "user_node_pool_max_count" {
  type        = number
  default     = 5
}

variable "private_dns_zone_id" {
  type        = string
  description = "ID da zona DNS privada"
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "ID do workspace do Log Analytics"
}

variable "tags" {
  type        = map(string)
  description = "Tags para os recursos"
  default     = {}
}
