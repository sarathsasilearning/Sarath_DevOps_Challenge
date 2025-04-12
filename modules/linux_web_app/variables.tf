variable "web_app_name" {
  description = "The name of the Linux Web App."
  type        = string
}

variable "location" {
  description = "The Azure region where the Linux Web App should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "service_plan_id" {
  description = "The ID of the Service Plan."
  type        = string
}

variable "app_settings" {
  description = "A map of app settings for the Linux Web App."
  type        = map(string)
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
