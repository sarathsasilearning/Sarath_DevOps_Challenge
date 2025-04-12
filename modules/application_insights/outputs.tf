output "app_insights_id" {
  description = "The ID of the Application Insights resource."
  value       = azurerm_application_insights.app_insights.id
}

output "app_insights_instrumentation_key" {
  description = "The instrumentation key of the Application Insights resource."
  value       = azurerm_application_insights.app_insights.instrumentation_key
}