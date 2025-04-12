provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Resource Group Module
module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}
# Service Plan Module
module "service_plan" {
  source              = "./modules/service_plan"
  service_plan_name   = var.service_plan_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  os_type           = var.os_type
  sku_name          = var.sku_name
}

# Linux Web App Module
module "linux_web_app" {
  source              = "./modules/linux_web_app"
  web_app_name                = var.web_app_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  service_plan_id     = module.service_plan.id
  #identity_id         = module.user_assigned_identity.id
  app_settings        = var.app_settings
}

# Monitor Action Group Module
module "monitor_action_group" {
  source              = "./modules/monitor_action_group"
  action_group_name   = var.action_group_name
  resource_group_name = module.resource_group.resource_group_name
  #arm_role_receivers  = var.arm_role_receivers
  short_name          = "AG" # Add a short name for the action group
}

# Application Insights Module
module "application_insights" {
  source              = "./modules/application_insights"
  app_insights_name   = var.app_insights_name
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
  workspace_id        = module.log_analytics_workspace.workspace_id
}

# Log Analytics Workspace Module
module "log_analytics_workspace" {
  source              = "./modules/log_analytics_workspace"
  workspace_name      = var.workspace_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
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
}