output "workspace_id" {
  description = "The ID of the Log Analytics workspace."
  value       = azurerm_log_analytics_workspace.workspace.id
}

# output "workspace_name" {
#   description = "The name of the Log Analytics workspace."
#   value       = azurerm_log_analytics_workspace.workspace.name
# }

# output "workspace_resource_group_name" {
#   description = "The name of the resource group where the Log Analytics workspace is located."
#   value       = azurerm_log_analytics_workspace.workspace.resource_group_name
# }