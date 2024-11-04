output "workspace_id" {
  value       = azurerm_log_analytics_workspace.workspace.id
  description = "ID do Workspace do Log Analytics"
}

output "workspace_name" {
  value       = azurerm_log_analytics_workspace.workspace.name
  description = "Nome do Workspace do Log Analytics"
}

output "primary_shared_key" {
  value       = azurerm_log_analytics_workspace.workspace.primary_shared_key
  sensitive   = true
  description = "Chave primária do Workspace"
} 