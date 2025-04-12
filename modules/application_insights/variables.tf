variable "app_insights_name" {
  description = "The name of the Application Insights resource."
  type        = string
}

variable "location" {
  description = "The Azure region where the Application Insights resource will be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the Application Insights resource will be created."
  type        = string
}
variable "workspace_id" {
  description = "The ID of the Log Analytics workspace to be used with Application Insights."
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}