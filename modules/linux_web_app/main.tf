resource "azurerm_linux_web_app" "this" {
  name                = var.web_app_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  app_settings = var.app_settings

  https_only = true

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = false
    ftps_state = "FtpsOnly"
    # Specify the Node.js stack
    application_stack {
      node_version = "20-lts"
    }
    ip_restriction_default_action = "Deny"
    ip_restriction {
      description = "frontdoor"
      priority    = 100
      service_tag = "AzureFrontDoor.Backend"
    }
  }

  tags = var.tags
}
