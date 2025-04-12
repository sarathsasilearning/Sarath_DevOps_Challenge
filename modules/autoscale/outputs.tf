output "autoscale_id" {
  description = "The ID of the autoscale setting."
  value       = azurerm_monitor_autoscale_setting.autoscale.id
}