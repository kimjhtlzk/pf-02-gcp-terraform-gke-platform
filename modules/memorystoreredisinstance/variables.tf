variable "name" {
  description = "Value for name."
  type        = any
  default     = null
}

variable "tier" {
  description = "Value for tier."
  type        = any
  default     = null
}

variable "location_id" {
  description = "Value for location id."
  type        = any
  default     = null
}

variable "alternative_location_id" {
  description = "Value for alternative location id."
  type        = any
  default     = null
}

variable "redis_version" {
  description = "Value for redis version."
  type        = any
  default     = null
}

variable "memory_size_gb" {
  description = "Value for memory size gb."
  type        = any
  default     = null
}

variable "read_replicas_mode" {
  description = "Value for read replicas mode."
  type        = any
  default     = null
}

variable "replica_count" {
  description = "Value for replica count."
  type        = any
  default     = null
}

variable "authorized_network" {
  description = "Value for authorized network."
  type        = any
  default     = null
}

variable "reserved_ip_range" {
  description = "Value for reserved ip range."
  type        = any
  default     = null
}

variable "connect_mode" {
  description = "Value for connect mode."
  type        = any
  default     = null
}

variable "auth_enabled" {
  description = "Value for auth enabled."
  type        = any
  default     = null
}

variable "transit_encryption_mode" {
  description = "Value for transit encryption mode."
  type        = any
  default     = null
}

variable "maintenance_policy" {
  description = "Value for maintenance policy."
  type        = any
  default     = null
}
