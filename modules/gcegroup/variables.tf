variable "groups" {
  description = "Value for groups."
  type = map(object({
    zone      = string
    network   = string
    instances = list(string)
    named_ports = list(object({
      protocol = string
      port     = number
    }))
  }))
  default = {}
}

variable "health" {
  description = "Value for health."
  type = map(object({
    protocol            = string
    check_interval_sec  = number
    timeout_sec         = number
    healthy_threshold   = number
    unhealthy_threshold = number
    check = list(object({
      port   = string
      path   = string
      header = string
    }))
  }))
  default = {}
}

variable "ssl" {
  description = "Value for ssl."
  type = list(object({
    sslkey_name = string
    private_key = string
    certificate = string
  }))
  default = []
}

variable "depends_on_list" {
  description = "Value for depends on list."
  type        = any
  default     = []
}
