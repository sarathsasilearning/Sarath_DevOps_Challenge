resource "azurerm_monitor_metric_alert" "this" {
  name                = var.name
  description         = var.description
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  severity            = var.severity
  frequency           = var.frequency
  window_size         = var.window_size
  enabled             = var.enabled

  criteria {
    metric_namespace = var.metric_namespace
    metric_name      = var.metric_name
    aggregation      = var.aggregation
    operator         = var.operator
    threshold        = var.threshold
  }

  action {
    action_group_id = var.action_group_id
  }

#   depends_on = var.depends_on
}
