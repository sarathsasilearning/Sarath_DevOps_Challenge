variable "subscription_id" {
  description = "The Azure subscription ID."
  type        = string
}

variable "location" {
  description = "The Azure region for the resource group."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "identity_name" {
  description = "The name of the user-assigned identity."
  type        = string
}

variable "credential_name" {
  description = "The name of the federated identity credential."
  type        = string
}

variable "service_plan_name" {
  description = "The name of the service plan."
  type        = string
}

variable "web_app_name" {
  description = "The name of the Linux web app."
  type        = string
}

# variable "hostname" {
#   description = "The custom hostname for the web app."
#   type        = string
# }

variable "action_group_name" {
  description = "The name of the monitor action group."
  type        = string
}

variable "short_name" {
  description = "A short name for the monitor action group."
  type        = string
  default     = "AG"
}

variable "app_insights_name" {
  description = "The name of the Application Insights resource."
  type        = string
}
variable "workspace_name" {
  description = "The name of the Log Analytics workspace."
  type        = string
}
# variable "app_settings" {
#   description = "A map of application settings for the web app."
#   type        = map(string)
# }

variable "sku_name" {
  description = "Sku Name for the service plan."
  type        = string
}

variable "os_type" {
  description = "OS type for the service plan (e.g., Linux)."
  type        = string
}

variable "arm_role_receivers" {
  description = "A list of ARM role receivers for the monitor action group."
  type = list(object({
    name                    = string
    role_id                 = string
    use_common_alert_schema = bool
  }))
}

variable "autoscale_name" {
  description = "The name of the autoscale setting."
  type        = string
}

variable "profile_name" {
  description = "The name of the autoscale profile."
  type        = string
}

variable "default_capacity" {
  description = "The default capacity for the autoscale profile."
  type        = number
}

variable "maximum_capacity" {
  description = "The maximum capacity for the autoscale profile."
  type        = number
}

variable "minimum_capacity" {
  description = "The minimum capacity for the autoscale profile."
  type        = number
}

variable "recurrence_days" {
  description = "The days for the recurrence schedule."
  type        = list(string)
}

variable "recurrence_hours" {
  description = "The hours for the recurrence schedule."
  type        = list(number)
}

variable "recurrence_minutes" {
  description = "The minutes for the recurrence schedule."
  type        = list(number)
}

variable "cpu_metric_name" {
  description = "The name of the CPU metric."
  type        = string
}

variable "cpu_metric_namespace" {
  description = "The namespace of the CPU metric."
  type        = string
}

variable "cpu_operator" {
  description = "The operator for the CPU metric trigger."
  type        = string
}

variable "cpu_statistic" {
  description = "The statistic for the CPU metric trigger."
  type        = string
}

variable "cpu_threshold" {
  description = "The threshold for the CPU metric trigger."
  type        = number
}

variable "cpu_time_aggregation" {
  description = "The time aggregation for the CPU metric trigger."
  type        = string
}

variable "cpu_time_grain" {
  description = "The time grain for the CPU metric trigger."
  type        = string
}

variable "cpu_time_window" {
  description = "The time window for the CPU metric trigger."
  type        = string
}

variable "cpu_cooldown" {
  description = "The cooldown period for the CPU scale action."
  type        = string
}

variable "cpu_scale_direction" {
  description = "The direction for the CPU scale action."
  type        = string
}

variable "cpu_scale_type" {
  description = "The type for the CPU scale action."
  type        = string
}

variable "cpu_scale_value" {
  description = "The value for the CPU scale action."
  type        = number
}

variable "memory_metric_name" {
  description = "The name of the memory metric."
  type        = string
}

variable "memory_metric_namespace" {
  description = "The namespace of the memory metric."
  type        = string
}

variable "memory_operator" {
  description = "The operator for the memory metric trigger."
  type        = string
}

variable "memory_statistic" {
  description = "The statistic for the memory metric trigger."
  type        = string
}

variable "memory_threshold" {
  description = "The threshold for the memory metric trigger."
  type        = number
}

variable "memory_time_aggregation" {
  description = "The time aggregation for the memory metric trigger."
  type        = string
}

variable "memory_time_grain" {
  description = "The time grain for the memory metric trigger."
  type        = string
}

variable "memory_time_window" {
  description = "The time window for the memory metric trigger."
  type        = string
}

variable "memory_cooldown" {
  description = "The cooldown period for the memory scale action."
  type        = string
}

variable "memory_scale_direction" {
  description = "The direction for the memory scale action."
  type        = string
}

variable "memory_scale_type" {
  description = "The type for the memory scale action."
  type        = string
}

variable "memory_scale_value" {
  description = "The value for the memory scale action."
  type        = number
}

variable "memory_operator_low" {
  description = "The operator for the low memory metric trigger."
  type        = string
}

variable "memory_threshold_low" {
  description = "The threshold for the low memory metric trigger."
  type        = number
}

variable "memory_scale_direction_low" {
  description = "The direction for the low memory scale action."
  type        = string
}

variable "cpu_operator_low" {
  description = "The operator for the low cpu metric trigger."
  type        = string
}

variable "cpu_threshold_low" {
  description = "The threshold for the low cpu metric trigger."
  type        = number
}

variable "cpu_scale_direction_low" {
  description = "The direction for the low cpu scale action."
  type        = string
}
variable "default_profile_name" {
  description = "The name of the default autoscale profile."
  type        = string
}

variable "default_maximum_capacity" {
  description = "The maximum capacity for the default autoscale profile."
  type        = number
}

variable "default_minimum_capacity" {
  description = "The minimum capacity for the default autoscale profile."
  type        = number
}

variable "default_recurrence_days" {
  description = "The days for the default recurrence schedule."
  type        = list(string)
}

variable "default_recurrence_hours" {
  description = "The hours for the default recurrence schedule."
  type        = list(number)
}

variable "default_recurrence_minutes" {
  description = "The minutes for the default recurrence schedule."
  type        = list(number)
}

variable "alerts" {
  description = "Map of alert configurations"
  type = map(object({
    description      = string
    severity         = number
    frequency        = string
    window_size      = string
    enabled          = bool
    aggregation      = string
    metric_name      = string
    metric_namespace = string
    operator         = string
    threshold        = number
  }))
}


variable "frontdoor_profile_name" {
  description = "The name of the CDN Front Door profile."
  type        = string
}

variable "response_timeout_seconds" {
  description = "The response timeout in seconds."
  type        = number
}

variable "frontdoor_sku_name" {
  description = "The SKU name for the CDN Front Door profile."
  type        = string
}

variable "endpoint_name" {
  description = "The name of the CDN Front Door endpoint."
  type        = string
}

variable "origin_group_name" {
  description = "The name of the CDN Front Door origin group."
  type        = string
}

variable "restore_traffic_time" {
  description = "The time in minutes to restore traffic to a healed or new endpoint."
  type        = number
}

variable "session_affinity_enabled" {
  description = "Whether session affinity is enabled."
  type        = bool
}

variable "health_probe_interval" {
  description = "The interval in seconds between health probes."
  type        = number
}

variable "health_probe_protocol" {
  description = "The protocol used for health probes."
  type        = string
}

variable "certificate_name_check_enabled" {
  description = "Whether certificate name check is enabled."
  type        = bool
}

# variable "host_name" {
#   description = "The hostname of the origin."
#   type        = string
# }

variable "origin_name" {
  description = "The name of the origin."
  type        = string
}

# variable "origin_host_header" {
#   description = "The host header of the origin."
#   type        = string
# }

variable "origin_weight" {
  description = "The weight of the origin."
  type        = number
}

variable "forwarding_protocol" {
  description = "The forwarding protocol for the route."
  type        = string
}

variable "route_name" {
  description = "The name of the route."
  type        = string
}

variable "patterns_to_match" {
  description = "The patterns to match for the route."
  type        = list(string)
}

variable "supported_protocols" {
  description = "The supported protocols for the route."
  type        = list(string)
}

variable "firewall_mode" {
  description = "The mode of the firewall policy."
  type        = string
}

variable "firewall_policy_name" {
  description = "The name of the firewall policy."
  type        = string
}

variable "firewall_sku_name" {
  description = "The SKU name for the firewall policy."
  type        = string
}

variable "security_policy_name" {
  description = "The name of the security policy."
  type        = string
}

variable "firewall_patterns_to_match" {
  description = "The patterns to match for the firewall policy."
  type        = list(string)
}