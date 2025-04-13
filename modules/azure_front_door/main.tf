resource "azurerm_cdn_frontdoor_profile" "profile" {
  name                     = var.frontdoor_profile_name
  resource_group_name      = var.resource_group_name
  response_timeout_seconds = var.response_timeout_seconds
  sku_name                 = var.frontdoor_sku_name
}

resource "azurerm_cdn_frontdoor_endpoint" "endpoint" {
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.profile.id
  name                     = var.endpoint_name
}

resource "azurerm_cdn_frontdoor_origin_group" "origin_group" {
  cdn_frontdoor_profile_id                                  = azurerm_cdn_frontdoor_profile.profile.id
  name                                                      = var.origin_group_name
  restore_traffic_time_to_healed_or_new_endpoint_in_minutes = var.restore_traffic_time
  session_affinity_enabled                                  = var.session_affinity_enabled
  health_probe {
    interval_in_seconds = var.health_probe_interval
    protocol            = var.health_probe_protocol
  }
  load_balancing {
  }
}

resource "azurerm_cdn_frontdoor_origin" "origin" {
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.origin_group.id
  certificate_name_check_enabled = var.certificate_name_check_enabled
  host_name                      = var.host_name
  name                           = var.origin_name
  origin_host_header             = var.origin_host_header
  weight                         = var.origin_weight
  enabled                        =true
}

resource "azurerm_cdn_frontdoor_route" "route" {
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.endpoint.id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group.id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.origin.id]
  forwarding_protocol           = var.forwarding_protocol
  name                          = var.route_name
  patterns_to_match             = var.patterns_to_match
  supported_protocols           = var.supported_protocols
  https_redirect_enabled       = false
  depends_on = [
    azurerm_cdn_frontdoor_origin_group.origin_group
 ]
}

resource "azurerm_cdn_frontdoor_firewall_policy" "firewall_policy" {
  mode                = var.firewall_mode
  name                = var.firewall_policy_name
  resource_group_name = var.resource_group_name
  sku_name            = var.firewall_sku_name
}

resource "azurerm_cdn_frontdoor_security_policy" "security_policy" {
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.profile.id
  name                     = var.security_policy_name
  security_policies {
    firewall {
      cdn_frontdoor_firewall_policy_id = azurerm_cdn_frontdoor_firewall_policy.firewall_policy.id
      association {
        patterns_to_match = var.firewall_patterns_to_match
        domain {
          cdn_frontdoor_domain_id = azurerm_cdn_frontdoor_endpoint.endpoint.id
        }
      }
    }
  }
}