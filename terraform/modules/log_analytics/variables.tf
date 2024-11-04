variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
}

variable "location" {
  description = "Localização dos recursos"
  type        = string
}

variable "environment" {
  description = "Ambiente (dev, staging, prod)"
  type        = string
}

variable "location_short" {
  description = "Abreviação da localização"
  type        = string
}

variable "workload" {
  description = "Nome do workload/projeto"
  type        = string
}

variable "retention_in_days" {
  description = "Dias de retenção dos logs"
  type        = number
  default     = 30
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default     = {}
} 