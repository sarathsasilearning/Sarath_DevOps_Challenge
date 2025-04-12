variable "location" {
  description = "The Azure region where the autoscale setting should be created."
  type        = string
}

variable "autoscale_name" {
  description = "The name of the autoscale setting."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "target_resource_id" {
  description = "The ID of the target resource for autoscale."
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

variable "cpu_operator_low" {
  description = "The operator for the low CPU metric trigger."
  type        = string
}

variable "cpu_threshold_low" {
  description = "The threshold for the low CPU metric trigger."
  type        = number
}

variable "cpu_scale_direction_low" {
  description = "The direction for the low CPU scale action."
  type        = string
}