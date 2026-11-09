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

variable "service_account_email" {
  description = "Service account the nodes run as."
  type        = string
}

variable "admin_networks" {
  description = "Networks allowed to reach the control plane."
  type = list(object({
    name    = string
    ip_cidr = string
  }))
  default = [
    {
      name    = "ops-vpn"
      ip_cidr = "203.0.113.10/32"
    }
  ]
}

module "network" {
  source = "../../modules/vpc"

  network_name = "example-gke"
  description  = "Network for the example GKE cluster."

  subnets = [
    {
      subnet_name        = "example-gke-nodes"
      subnet_ip          = "10.0.0.0/20"
      subnet_region      = "asia-northeast3"
      log_config_enabled = true
      secondary_ip = [
        {
          name          = "pods"
          ip_cidr_range = "10.16.0.0/14"
        },
        {
          name          = "services"
          ip_cidr_range = "10.20.0.0/20"
        }
      ]
    }
  ]
}

module "gke" {
  source = "../../modules/gke"

  gke_cluster = "example-regional"
  region      = "asia-northeast3"
  node_zones  = ["a", "b", "c"]

  network    = module.network.network.id
  subnetwork = module.network.subnets["example-gke-nodes"]
  ip_allocation = {
    pods     = "pods"
    services = "services"
  }

  enable_private_nodes       = true
  master_ipv4_cidr_block     = "172.16.0.0/28"
  master_authorized_networks = var.admin_networks
  managed_prometheus         = true
  service_account            = var.service_account_email
  node_version               = "1.31"

  node_pool = {
    game = {
      autoscaling_enable = true
      min_node_count     = 3
      max_node_count     = 12
      location_policy    = "BALANCED"
      node_count         = null
      pool_version       = "1.31"
      machine_type       = "e2-standard-4"
      tags               = ["gke-node"]

      # Five extra nodes come up first, and no node is taken away until its replacement is ready.
      strategy        = ["SURGE"]
      max_surge       = 5
      max_unavailable = 0

      # Soak time is read only when the strategy is switched to BLUE_GREEN.
      node_pool_soak_duration = "3600s"
    }
  }
}
