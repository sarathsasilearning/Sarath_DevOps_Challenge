variable "name" {
  description = "The name of the metric alert."
  type        = string
}

variable "description" {
  description = "The description of the metric alert."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the metric alert."
  type        = string
}

variable "scopes" {
  description = "The list of resource IDs the alert applies to."
  type        = list(string)
}

variable "severity" {
  description = "The severity of the alert."
  type        = number
}

variable "frequency" {
  description = "The frequency at which the alert is evaluated."
  type        = string
  default     = "PT1M"
}

variable "window_size" {
  description = "The time window over which the alert is evaluated."
  type        = string
  default     = "PT5M"
}

variable "enabled" {
  description = "Whether the alert is enabled."
  type        = bool
  default     = true
}

variable "metric_namespace" {
  description = "The namespace of the metric."
  type        = string
}

variable "metric_name" {
  description = "The name of the metric."
  type        = string
}

variable "aggregation" {
  description = "The aggregation type of the metric."
  type        = string
}

variable "operator" {
  description = "The operator used to compare the metric value against the threshold."
  type        = string
}

variable "threshold" {
  description = "The threshold value for the metric."
  type        = number
}

variable "action_group_id" {
  description = "The ID of the action group to associate with the alert."
  type        = string
}

# variable "depends_on" {
#   description = "A list of dependencies for the metric alert."
#   type        = list(any)
#   default     = []
# }
