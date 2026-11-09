variable "project" {
  description = "Project ID"
  type        = string
  default     = null
}

variable "email" {
  description = "User email"
  type        = string
  default     = null
}

variable "binding_roles" {
  description = "Attach role list"
  type        = list(string)
  default     = []
}

variable "custom_role_ids" {
  description = "Created custom role IDs"
  type        = any
  default     = null
}

variable "depends_on_list" {
  description = "Value for depends on list."
  type        = any
  default     = []
}
