
# Resource Group Module
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

# Log Analytics Workspace Module
module "log_analytics_workspace" {
  source              = "./modules/log_analytics_workspace"
  workspace_name      = var.workspace_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
}

# Application Insights Module
module "application_insights" {
  source              = "./modules/application_insights"
  app_insights_name   = var.app_insights_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  workspace_id        = module.log_analytics_workspace.workspace_id
  depends_on = [ module.log_analytics_workspace ]
}

# Service Plan Module
module "service_plan" {
  source              = "./modules/service_plan"
  service_plan_name   = var.service_plan_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  os_type             = var.os_type
  sku_name            = var.sku_name
}

# Linux Web App Module
module "linux_web_app" {
  source              = "./modules/linux_web_app"
  web_app_name        = var.web_app_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  service_plan_id     = module.service_plan.id
  #pp_settings        = var.app_settings
  
  app_settings = {
    APPLICATIONINSIGHTS_CONNECTION_STRING      = module.application_insights.connection_string
    ApplicationInsightsAgent_EXTENSION_VERSION = "~3"
    XDT_MicrosoftApplicationInsights_Mode      = "default"
}
}

# Monitor Action Group Module
module "monitor_action_group" {
  source              = "./modules/monitor_action_group"
  action_group_name   = var.action_group_name
  resource_group_name = module.resource_group.resource_group_name
  short_name          = "AG" # Add a short name for the action group
}

# Autoscale Module
module "autoscale" {
  source              = "./modules/autoscale"
  location            = var.location
  autoscale_name      = var.autoscale_name
  resource_group_name = module.resource_group.resource_group_name
  target_resource_id  = module.service_plan.id
  profile_name        = var.profile_name
  default_capacity    = var.default_capacity
  maximum_capacity    = var.maximum_capacity
  minimum_capacity    = var.minimum_capacity
  recurrence_days     = var.recurrence_days
  recurrence_hours    = var.recurrence_hours
  recurrence_minutes  = var.recurrence_minutes
  cpu_metric_name     = var.cpu_metric_name
  cpu_metric_namespace = var.cpu_metric_namespace
  cpu_operator        = var.cpu_operator
  cpu_statistic       = var.cpu_statistic
  cpu_threshold       = var.cpu_threshold
  cpu_time_aggregation = var.cpu_time_aggregation
  cpu_time_grain      = var.cpu_time_grain
  cpu_time_window     = var.cpu_time_window
  cpu_cooldown        = var.cpu_cooldown
  cpu_scale_direction = var.cpu_scale_direction
  cpu_scale_type      = var.cpu_scale_type
  cpu_scale_value     = var.cpu_scale_value
  memory_metric_name  = var.memory_metric_name
  memory_metric_namespace = var.memory_metric_namespace
  memory_operator     = var.memory_operator
  memory_statistic    = var.memory_statistic
  memory_threshold    = var.memory_threshold
  memory_time_aggregation = var.memory_time_aggregation
  memory_time_grain   = var.memory_time_grain
  memory_time_window  = var.memory_time_window
  memory_cooldown     = var.memory_cooldown
  memory_scale_direction = var.memory_scale_direction
  memory_scale_type   = var.memory_scale_type
  memory_scale_value  = var.memory_scale_value
  memory_operator_low = var.memory_operator_low
  memory_threshold_low = var.memory_threshold_low
  memory_scale_direction_low = var.memory_scale_direction_low
  cpu_operator_low = var.memory_operator_low
  cpu_threshold_low = var.memory_threshold_low
  cpu_scale_direction_low = var.memory_scale_direction_low
  default_profile_name = var.default_profile_name
  default_maximum_capacity = var.default_maximum_capacity
  default_minimum_capacity = var.default_minimum_capacity
  default_recurrence_days = var.default_recurrence_days
  default_recurrence_hours = var.default_recurrence_hours
  default_recurrence_minutes = var.default_recurrence_minutes
  depends_on          = [module.service_plan]
}

# Metric Alerts Module
module "metric_alerts" {
  source              = "./modules/monitor_metric_alerts"
  for_each            = var.alerts
  name                = each.key
  description         = each.value.description
  resource_group_name = module.resource_group.resource_group_name
  scopes              = [module.application_insights.app_insights_id]
  severity            = each.value.severity
  frequency           = each.value.frequency
  window_size         = each.value.window_size
  enabled             = each.value.enabled
  metric_namespace    = each.value.metric_namespace
  metric_name         = each.value.metric_name
  aggregation         = each.value.aggregation
  operator            = each.value.operator
  threshold           = each.value.threshold
  action_group_id     = module.monitor_action_group.action_group_id
}

# Azure Front Door Module
module "azure_front_door" {
  source                     = "./modules/azure_front_door"
  frontdoor_profile_name     = var.frontdoor_profile_name
  resource_group_name        = module.resource_group.resource_group_name
  response_timeout_seconds   = var.response_timeout_seconds
  frontdoor_sku_name         = var.frontdoor_sku_name
  endpoint_name              = var.endpoint_name
  origin_group_name          = var.origin_group_name
  restore_traffic_time       = var.restore_traffic_time
  session_affinity_enabled   = var.session_affinity_enabled
  health_probe_interval      = var.health_probe_interval
  health_probe_protocol      = var.health_probe_protocol
  certificate_name_check_enabled = var.certificate_name_check_enabled
  host_name                  = module.linux_web_app.default_hostname
  origin_name                = var.origin_name
  origin_host_header         = module.linux_web_app.default_hostname
  origin_weight              = var.origin_weight
  forwarding_protocol        = var.forwarding_protocol
  route_name                 = var.route_name
  patterns_to_match          = var.patterns_to_match
  supported_protocols        = var.supported_protocols
  firewall_mode              = var.firewall_mode
  firewall_policy_name       = var.firewall_policy_name
  firewall_sku_name          = var.firewall_sku_name
  security_policy_name       = var.security_policy_name
  firewall_patterns_to_match = var.firewall_patterns_to_match
  depends_on          = [module.resource_group]
}