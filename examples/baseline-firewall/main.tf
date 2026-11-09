terraform {
  required_version = ">= 1.9, < 2.0"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 6.0, < 7.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "asia-northeast3"
}

variable "project_id" {
  description = "Project to deploy into."
  type        = string
  default     = "example-project"
}

variable "vpn_source_ranges" {
  description = "Client-to-site VPN ranges that may reach management ports."
  type        = list(string)
  default     = ["203.0.113.10/32"]
}

module "network" {
  source = "../../modules/vpc"

  network_name = "example-baseline"
  description  = "Network protected by the baseline firewall."

  subnets = [
    {
      subnet_name        = "example-baseline-app"
      subnet_ip          = "10.0.0.0/20"
      subnet_region      = "asia-northeast3"
      log_config_enabled = true
      secondary_ip       = []
    }
  ]
}

# Priority 1000 lets the VPN in. Priority 65534 denies other outbound traffic.
module "baseline_firewall" {
  source = "../../modules/c2sfirewall"

  network           = module.network.network.id
  vpn_source_ranges = var.vpn_source_ranges
  management_ports  = ["22", "3389", "6379"]
}
