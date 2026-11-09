variable "artifact_registry_name" {
  description = "Value for artifact registry name."
  type        = any
  default     = null
}

variable "location" {
  description = "Value for location."
  type        = any
  default     = null
}

variable "format" {
  description = "Value for format."
  type        = any
  default     = null
}

variable "cleanup_policies" {
  description = "Value for cleanup policies."
  type = list(object({
    id     = string
    action = string
    condition = optional(object({
      tag_state             = optional(string)
      tag_prefixes          = optional(list(string))
      older_than            = optional(string)
      newer_than            = optional(string)
      version_name_prefixes = optional(list(string))
      package_name_prefixes = optional(list(string))
    }))
    most_recent_versions = optional(object({
      keep_count            = optional(number)
      package_name_prefixes = optional(list(string))
    }))
  }))
  default = []
}
