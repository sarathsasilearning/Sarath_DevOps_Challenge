variable "frontdoor_profile_name" {
  description = "The name of the CDN Front Door profile."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
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

variable "host_name" {
  description = "The hostname of the origin."
  type        = string
}

variable "origin_name" {
  description = "The name of the origin."
  type        = string
}

variable "origin_host_header" {
  description = "The host header of the origin."
  type        = string
}

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