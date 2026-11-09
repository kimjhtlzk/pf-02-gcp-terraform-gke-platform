variable "bucket_name" {
  description = "Value for bucket name."
  type        = any
  default     = null
}

variable "location" {
  description = "Value for location."
  type        = any
  default     = null
}

variable "storage_class" {
  description = "Value for storage class."
  type        = any
  default     = null
}

variable "force_destroy" {
  description = "Value for force destroy."
  type        = any
  default     = null
}

variable "uniform_bucket_level_access" {
  description = "Value for uniform bucket level access."
  type        = any
  default     = null
}

variable "lifecycle_rule" {
  description = "Value for lifecycle rule."
  type        = any
  default     = null
}

variable "storage_bucket_iam_member" {
  description = "Map of IAM members for the storage bucket"
  type = map(object({
    member = string
    role   = string
  }))
  default = {}
}

variable "versioning" {
  description = "Keep previous object versions."
  type        = bool
  default     = true
}

variable "soft_delete_retention_seconds" {
  description = "How long deleted objects stay recoverable. Use 0 to turn soft delete off."
  type        = number
  default     = 604800
}
