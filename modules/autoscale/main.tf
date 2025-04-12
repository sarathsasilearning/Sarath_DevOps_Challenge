resource "azurerm_monitor_autoscale_setting" "autoscale" {
  location            = var.location
  name                = var.autoscale_name
  resource_group_name = var.resource_group_name
  target_resource_id  = var.target_resource_id

  profile {
    name = var.profile_name
    capacity {
      default = var.default_capacity
      maximum = var.maximum_capacity
      minimum = var.minimum_capacity
    }
    recurrence {
      days    = var.recurrence_days
      hours   = var.recurrence_hours
      minutes = var.recurrence_minutes
    }
    rule {
      metric_trigger {
        metric_name        = var.cpu_metric_name
        metric_namespace   = var.cpu_metric_namespace
        metric_resource_id = var.target_resource_id
        operator           = var.cpu_operator
        statistic          = var.cpu_statistic
        threshold          = var.cpu_threshold
        time_aggregation   = var.cpu_time_aggregation
        time_grain         = var.cpu_time_grain
        time_window        = var.cpu_time_window
      }
      scale_action {
        cooldown  = var.cpu_cooldown
        direction = var.cpu_scale_direction
        type      = var.cpu_scale_type
        value     = var.cpu_scale_value
      }
    }
    rule {
      metric_trigger {
        metric_name        = var.cpu_metric_name
        metric_namespace   = var.cpu_metric_namespace
        metric_resource_id = var.target_resource_id
        operator           = var.cpu_operator_low
        statistic          = var.cpu_statistic
        threshold          = var.cpu_threshold_low
        time_aggregation   = var.cpu_time_aggregation
        time_grain         = var.cpu_time_grain
        time_window        = var.cpu_time_window
      }
      scale_action {
        cooldown  = var.cpu_cooldown
        direction = var.cpu_scale_direction_low
        type      = var.cpu_scale_type
        value     = var.cpu_scale_value
      }
    }
    rule {
      metric_trigger {
        metric_name        = var.memory_metric_name
        metric_namespace   = var.memory_metric_namespace
        metric_resource_id = var.target_resource_id
        operator           = var.memory_operator
        statistic          = var.memory_statistic
        threshold          = var.memory_threshold
        time_aggregation   = var.memory_time_aggregation
        time_grain         = var.memory_time_grain
        time_window        = var.memory_time_window
      }
      scale_action {
        cooldown  = var.memory_cooldown
        direction = var.memory_scale_direction
        type      = var.memory_scale_type
        value     = var.memory_scale_value
      }
    }
    rule {
      metric_trigger {
        metric_name        = var.memory_metric_name
        metric_namespace   = var.memory_metric_namespace
        metric_resource_id = var.target_resource_id
        operator           = var.memory_operator_low
        statistic          = var.memory_statistic
        threshold          = var.memory_threshold_low
        time_aggregation   = var.memory_time_aggregation
        time_grain         = var.memory_time_grain
        time_window        = var.memory_time_window
      }
      scale_action {
        cooldown  = var.memory_cooldown
        direction = var.memory_scale_direction_low
        type      = var.memory_scale_type
        value     = var.memory_scale_value
      }
    }
  }
  profile {
    name = var.default_profile_name
    capacity {
      default = var.default_capacity
      maximum = var.default_maximum_capacity
      minimum = var.default_minimum_capacity
    }
    recurrence {
      days    = var.default_recurrence_days
      hours   = var.default_recurrence_hours
      minutes = var.default_recurrence_minutes
    }
  }
}