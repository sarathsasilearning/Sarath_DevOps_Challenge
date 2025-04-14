
output "resource_group_name" {
  description = "The name of the resource group."
  value       = module.resource_group.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group."
  value       = module.resource_group.location
}

output "web_app_name" {
  description = "The name of the Linux Web App."
  value       = module.linux_web_app.web_app_name
}

output "web_app_default_hostname" {
  description = "The default hostname of the Linux Web App."
  value       = module.linux_web_app.default_hostname
}
