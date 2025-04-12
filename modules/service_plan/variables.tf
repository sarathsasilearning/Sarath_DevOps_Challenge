variable "service_plan_name" {
  description = "The name of the Service Plan."
  type        = string
}

variable "location" {
  description = "The Azure region where the Service Plan should be created."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "os_type" {
  description = "The OS type for the Service Plan (e.g., Linux)."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Service Plan."
  type        = string
}
