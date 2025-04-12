variable "action_group_name" {
  description = "The name of the action group."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "short_name" {
  description = "The short name of the action group."
  type        = string
}

variable "email_receivers" {
  description = "A map of email receivers."
  type = map(object({
    name                    = string
    email_address           = string
    use_common_alert_schema = optional(bool, false)
  }))
  default = {}
}

variable "webhook_receivers" {
  description = "A map of webhook receivers."
  type = map(object({
    name                    = string
    service_uri             = string
    use_common_alert_schema = optional(bool, false)
  }))
  default = {}
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
