variable "name" {
  description = "The name of the Federated Identity Credential."
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "parent_id" {
  description = "The ID of the parent resource (User Assigned Identity)."
  type        = string
}

variable "issuer" {
  description = "The issuer of the token."
  type        = string
}

variable "subject" {
  description = "The subject claim that should be expected in the token."
  type        = string
}

variable "audience" {
  description = "The audience claim that should be expected in the token."
  type        = list(string)
}
