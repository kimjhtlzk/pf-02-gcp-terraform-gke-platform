variable "name" {
  description = "Value for name."
  type        = any
  default     = null
}

variable "region" {
  description = "Value for region."
  type        = any
  default     = null
}

variable "shard_count" {
  description = "Value for shard count."
  type        = any
  default     = null
}

variable "replica_count" {
  description = "Value for replica count."
  type        = any
  default     = null
}

variable "network" {
  description = "Value for network."
  type        = any
  default     = null
}

variable "authorization_mode" {
  description = "Value for authorization mode."
  type        = any
  default     = null
}

variable "transit_encryption_mode" {
  description = "Value for transit encryption mode."
  type        = any
  default     = null
}
