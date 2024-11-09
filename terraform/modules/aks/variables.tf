
variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}
variable "location" {
  type        = string
  description = "Localização dos recursos"
}
variable "tags" {
  type        = map(string)
  description = "Tags dos recursos"
}
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