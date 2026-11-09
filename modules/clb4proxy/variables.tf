variable "name" {
  description = "Value for name."
  type        = any
  default     = null
}

variable "forwarding_rule" {
  description = "Value for forwarding rule."
  type        = any
  default     = null
}

variable "proxy_rule" {
  description = "Value for proxy rule."
  type        = any
  default     = null
}

variable "proxy_name" {
  description = "Value for proxy name."
  type        = any
  default     = null
}

variable "backend_name" {
  description = "Value for backend name."
  type        = any
  default     = null
}

variable "backend_port" {
  description = "Value for backend port."
  type        = any
  default     = null
}

variable "timeout_sec" {
  description = "Value for timeout sec."
  type        = any
  default     = null
}

variable "load_balancing_scheme" {
  description = "Value for load balancing scheme."
  type        = any
  default     = null
}

variable "session_affinity" {
  description = "Value for session affinity."
  type        = any
  default     = null
}

variable "connection_draining_timeout_sec" {
  description = "Value for connection draining timeout sec."
  type        = any
  default     = null
}

variable "group" {
  description = "Value for group."
  type        = any
  default     = null
}

variable "backend_pool" {
  description = "Value for backend pool."
  type        = any
  default     = null
}

variable "health_checks" {
  description = "Value for health checks."
  type        = any
  default     = null
}

variable "ssl_certificate" {
  description = "Value for ssl certificate."
  type        = any
  default     = null
}
