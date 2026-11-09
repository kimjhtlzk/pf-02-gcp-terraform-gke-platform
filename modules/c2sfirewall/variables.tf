variable "network" {
  description = "vpc id"
  type        = string
}

variable "vpn_source_ranges" {
  description = "Source ranges of the client-to-site VPN that may reach management ports."
  type        = list(string)
  default     = ["203.0.113.10/32"]
}

variable "management_ports" {
  description = "TCP ports reachable only from the VPN source ranges."
  type        = list(string)
  default     = ["22", "3389", "6379"]
}
