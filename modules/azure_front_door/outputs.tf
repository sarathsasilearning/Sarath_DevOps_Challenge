output "cdn_frontdoor_profile_id" {
  description = "The ID of the CDN Front Door profile."
  value       = azurerm_cdn_frontdoor_profile.profile.id
}

output "cdn_frontdoor_endpoint_id" {
  description = "The ID of the CDN Front Door endpoint."
  value       = azurerm_cdn_frontdoor_endpoint.endpoint.id
}

output "cdn_frontdoor_origin_group_id" {
  description = "The ID of the CDN Front Door origin group."
  value       = azurerm_cdn_frontdoor_origin_group.origin_group.id
}

output "cdn_frontdoor_origin_id" {
  description = "The ID of the CDN Front Door origin."
  value       = azurerm_cdn_frontdoor_origin.origin.id
}

output "cdn_frontdoor_route_id" {
  description = "The ID of the CDN Front Door route."
  value       = azurerm_cdn_frontdoor_route.route.id
}

output "cdn_frontdoor_firewall_policy_id" {
  description = "The ID of the CDN Front Door firewall policy."
  value       = azurerm_cdn_frontdoor_firewall_policy.firewall_policy.id
}

output "cdn_frontdoor_security_policy_id" {
  description = "The ID of the CDN Front Door security policy."
  value       = azurerm_cdn_frontdoor_security_policy.security_policy.id
}