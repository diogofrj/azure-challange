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
  description = "Tags para os recursos"
  default     = {}
}