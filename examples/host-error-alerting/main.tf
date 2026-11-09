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

variable "slack_auth_token" {
  description = "Slack bot token. Pass it with TF_VAR_slack_auth_token from a secret store."
  type        = string
  sensitive   = true
}

locals {
  metric_name = "compute_host_error"
}

module "host_error_alert" {
  source = "../../modules/stackdriver"

  project_id       = var.project_id
  channel_name     = "infra-alerts"
  slack_auth_token = var.slack_auth_token

  metrics = [
    {
      metric_name   = local.metric_name
      metric_filter = "protoPayload.methodName=\"compute.instances.hostError\""
    }
  ]

  policy_name   = "GCE host error"
  policy_filter = "metric.type=\"logging.googleapis.com/user/${local.metric_name}\" AND resource.type=\"gce_instance\""

  alignment_period = "60s"
  duration         = "0s"
  threshold_value  = 0
  trigger_count    = 1
  trigger_percent  = null
}
