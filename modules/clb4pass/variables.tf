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

variable "protocol" {
  description = "Value for protocol."
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

variable "timeout_sec" {
  description = "Value for timeout sec."
  type        = any
  default     = null
}

variable "connection_draining_timeout_sec" {
  description = "Value for connection draining timeout sec."
  type        = any
  default     = null
}

variable "locality_lb_policy" {
  description = "Value for locality lb policy."
  type        = any
  default     = null
}

variable "frontend_ip" {
  description = "Value for frontend ip."
  type        = any
  default     = null
}

variable "log_config_enable" {
  description = "Value for log config enable."
  type        = any
  default     = null
}

variable "log_config_sample_rate" {
  description = "Value for log config sample rate."
  type        = any
  default     = null
}

variable "network" {
  description = "Value for network."
  type        = any
  default     = null
}

variable "subnetwork" {
  description = "Value for subnetwork."
  type        = any
  default     = null
}

variable "shared_ip" {
  description = "Value for shared ip."
  type        = any
  default     = null
}

variable "ip_address" {
  description = "Value for ip address."
  type        = any
  default     = null
}

variable "backend" {
  description = "Value for backend."
  type        = any
  default     = null
}

variable "health_checks" {
  description = "Value for health checks."
  type        = any
  default     = null
}

variable "forwarding_rule" {
  description = "Value for forwarding rule."
  type        = any
  default     = null
}
