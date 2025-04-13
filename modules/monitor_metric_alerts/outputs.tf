output "metric_alert_id" {
  description = "The ID of the metric alert."
  value       = azurerm_monitor_metric_alert.this.id
}
