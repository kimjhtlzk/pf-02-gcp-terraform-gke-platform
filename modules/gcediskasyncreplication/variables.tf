variable "primary_disk_name" {
  description = "primary_disk_name"
  type        = any
  default     = null
}

variable "primary_zone" {
  description = "primary_zone"
  type        = any
  default     = null
}

variable "primary_type" {
  description = "primary_type"
  type        = any
  default     = "null"
}

variable "primary_size" {
  description = "disk_size"
  type        = any
  default     = null
}

variable "secondary_disk_name" {
  description = "secondary_disk_name"
  type        = any
  default     = null
}

variable "secondary_zone" {
  description = "secondary_zone"
  type        = any
  default     = null
}

variable "sync_start" {
  description = "Value for sync start."
  type        = any
  default     = null
}
