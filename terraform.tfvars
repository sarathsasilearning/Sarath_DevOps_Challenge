subscription_id      = "b31f4fdf-4e8c-4ae2-9808-5ba627f181c8"
location             = "eastus2"
resource_group_name  = "1-webapp-prod-fmc-group"
identity_name        = "1-webapp-prod-fmc-id-bb97"
credential_name      = "1-sarathsasilearning-testrepo-aecd"
service_plan_name    = "1-ASP-webappprodfmcgroup-bcfd"
web_app_name         = "1-webapp-prod-fmc"
action_group_name    = "1-Application Insights Smart Detection"
app_insights_name    = "1-webapp-prod-fmc"
workspace_name       = "my-log-analytics-workspace"
os_type            = "Linux"   
sku_name           = "S1" 

arm_role_receivers = [
  {
    name                    = "Monitoring Contributor"
    role_id                 = "749f88d5-cbae-40b8-bcfc-e573ddc772fa"
    use_common_alert_schema = true
  },
  {
    name                    = "Monitoring Reader"
    role_id                 = "43d0d8ad-25c7-4714-9337-8ba259a9fe05"
    use_common_alert_schema = true
  }
]
# Autoscale configuration
autoscale_name      = "autoscaling-webapp"
profile_name        = "Profile 2"
default_capacity    = 1
maximum_capacity    = 5
minimum_capacity    = 1
recurrence_days     = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
recurrence_hours    = [0]
recurrence_minutes  = [0]
cpu_metric_name     = "CpuPercentage"
cpu_metric_namespace = "microsoft.web/serverfarms"
cpu_operator        = "GreaterThan"
cpu_statistic       = "Average"
cpu_threshold       = 85
cpu_time_aggregation = "Average"
cpu_time_grain      = "PT1M"
cpu_time_window     = "PT10M"
cpu_cooldown        = "PT5M"
cpu_scale_direction = "Increase"
cpu_scale_type      = "ChangeCount"
cpu_scale_value     = 1
memory_metric_name  = "MemoryPercentage"
memory_metric_namespace = "microsoft.web/serverfarms"
memory_operator     = "GreaterThan"
memory_statistic    = "Average"
memory_threshold    = 85
memory_time_aggregation = "Average"
memory_time_grain   = "PT1M"
memory_time_window  = "PT10M"
memory_cooldown     = "PT5M"
memory_scale_direction = "Increase"
memory_scale_type   = "ChangeCount"
memory_scale_value  = 1
memory_operator_low = "LessThan"
memory_threshold_low = 50
memory_scale_direction_low = "Decrease"
cpu_threshold_low = 50
cpu_scale_direction_low = "Decrease"
cpu_operator_low = "LessThan"
default_profile_name = "Default Profile"
default_maximum_capacity = 5
default_minimum_capacity = 1
default_recurrence_days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
default_recurrence_hours = [23]
default_recurrence_minutes = [59]

alerts = {
  "Application response" = {
    description      = "Webapp - webapp-prod-fmc is responding very slow, response time is more than 2 seconds for past 5 minutes. Please check"
    severity         = 0
    frequency        = "PT1M"
    window_size      = "PT5M"
    enabled          = true
    aggregation      = "Average"
    metric_name      = "requests/duration"
    metric_namespace = "microsoft.insights/components"
    operator         = "GreaterThan"
    threshold        = 2000
  },
  "Availability test" = {
    description      = "Critical: webapp application webapp-prod-fmc availability is less than 95%, please check."
    severity         = 0
    frequency        = "PT1M"
    window_size      = "PT5M"
    enabled          = true
    aggregation      = "Average"
    metric_name      = "availabilityResults/availabilityPercentage"
    metric_namespace = "microsoft.insights/components"
    operator         = "LessThan"
    threshold        = 95
  },
  "CPU usage" = {
    description      = "Webapp - Webapp-prod-fmc CPU usage is more than 80% for past 5 minutes. Please check."
    severity         = 0
    frequency        = "PT1M"
    window_size      = "PT5M"
    enabled          = true
    aggregation      = "Average"
    metric_name      = "performanceCounters/processCpuPercentage"
    metric_namespace = "microsoft.insights/components"
    operator         = "GreaterThan"
    threshold        = 80
  },
  "Failed requests" = {
    description      = "Webapp - webapp-prod-fmc has more than 50 failed requests in past 5 minutes. Please check."
    severity         = 0
    frequency        = "PT1M"
    window_size      = "PT5M"
    enabled          = true
    aggregation      = "Count"
    metric_name      = "requests/failed"
    metric_namespace = "microsoft.insights/components"
    operator         = "GreaterThan"
    threshold        = 50
  }
}

# Front Door configuration
# This is a sample configuration for Azure Front Door. You can modify it as per your requirements.
frontdoor_profile_name   = "1-fmc-webapp-challenge"
response_timeout_seconds = 60
frontdoor_sku_name   = "Standard_AzureFrontDoor"
endpoint_name        = "1-fmc-webapp-challenge"
origin_group_name    = "1-fmc-webapp-challenge"
restore_traffic_time = 0
session_affinity_enabled = false
health_probe_interval = 100
health_probe_protocol = "Https"
certificate_name_check_enabled = true
origin_name           = "1-default-webapp-origin"
origin_weight         = 1000
forwarding_protocol   = "HttpsOnly"
route_name            = "1-default-webapp-route"
patterns_to_match     = ["/*"]
supported_protocols   = ["Https"]
firewall_mode         = "Detection"
firewall_policy_name  = "DefaultWebAppWaf4ebfdac82a8f4a2dbd71e1779ce4d4ef"
firewall_sku_name     = "Standard_AzureFrontDoor"
security_policy_name  = "1-default-webapp-security-policy-webapp-prod-fmc-f1692acd"
firewall_patterns_to_match = ["/*"]
