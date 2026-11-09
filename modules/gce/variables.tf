variable "domain" {
  description = "Domain name"
  type        = any
  default     = "example.com"
}

variable "name" {
  description = "VM Instance name"
  type        = any
  default     = null
}

variable "region" {
  description = "Region"
  type        = any
  default     = null
}

variable "zone" {
  description = "Zone"
  type        = string
  default     = "a"
}

variable "machine_type" {
  description = "VM Instanse machine type"
  type        = any
}

variable "min_cpu_platform" {
  description = "VM Instance cpu platform"
  type        = any
  default     = "Intel Skylake"
}

variable "network" {
  description = "network ID"
  type        = any
  default     = null
}

variable "subnet" {
  description = "Subnet ID"
  type        = any
  default     = null
}

variable "network_ip" {
  description = "Subnetwork IP"
  type        = any
  default     = null
}

variable "private" {
  description = "Do not create Public IP "
  type        = any
  default     = false
}

variable "scratch_disk" {
  description = "Value for scratch disk."
  type        = any
  default     = null
}

variable "ipaddress" {
  description = "Public IP Address Name"
  type        = any
  default     = null
}

variable "service_account" {
  description = "Service Account info"
  type = object({
    email  = string
    scopes = list(string)
  })
  default = {
    email  = null
    scopes = ["cloud-platform"]
  }
}

variable "boot_disk" {
  description = "VM Instance boot disk"
  type        = any
  default     = null
}

variable "attached_disk" {
  description = "VM Instance additional disk"
  type        = any
  default     = null
}

variable "tags" {
  description = "Resource Tags"
  type        = list(any)
  default     = []
}

variable "ssh_keys_user" {
  description = "Value for ssh keys user."
  type        = any
  default     = null
}

variable "ssh_keys" {
  description = "Value for ssh keys."
  type        = any
  default     = null
}

variable "block_project_ssh_keys" {
  description = "Value for block project ssh keys."
  type        = any
  default     = null
}

variable "depends_on_list" {
  description = "Dependency list"
  type        = list(any)
  default     = []
}

variable "resource_policies" {
  description = "Value for resource policies."
  type        = any
  default     = null
}

variable "deletion_protection" {
  description = "Value for deletion protection."
  type        = any
  default     = true
}

variable "enable_secure_boot" {
  description = "Turn on Secure Boot for the instance. Disable only for images with unsigned kernel modules."
  type        = bool
  default     = true
}
