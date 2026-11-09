variable "network_name" {
  description = "Value for network name."
  type        = string
}

variable "routing_mode" {
  description = "Value for routing mode."
  type        = string
  default     = "GLOBAL"
}

variable "description" {
  description = "Value for description."
  type        = string
}

variable "auto_create_subnetworks" {
  description = "Value for auto create subnetworks."
  type        = bool
  default     = false
}

variable "subnets" {
  description = "Value for subnets."
  type = list(object({
    subnet_name        = string
    subnet_ip          = string
    subnet_region      = string
    log_config_enabled = bool
    secondary_ip = list(object({
      name          = string
      ip_cidr_range = string
    }))
  }))
  default = []
}

variable "depends_on_list" {
  description = "Value for depends on list."
  type        = any
  default     = []
}
