variable "name" {
  description = "Public IP Address Name"
  type        = string
}

variable "region" {
  description = "Public IP Address region"
  type        = string
}

variable "type" {
  description = "IP Type on Global (Default: regional)"
  type        = any
  default     = "regional"
}
