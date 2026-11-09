variable "channel_name" {
  description = "total channel name"
  type        = any
}

variable "policy_name" {
  description = "policy name & bot name"
  type        = any
}

variable "policy_filter" {
  description = "policy filter"
  type        = any
}

variable "metrics" {
  description = "logging metrics"
  type        = any
}

variable "project_id" {
  description = "project id"
  type        = any
}

variable "alignment_period" {
  description = "alignment period"
  type        = any
}

variable "duration" {
  description = "duration"
  type        = any
}

variable "threshold_value" {
  description = "threshold value"
  type        = any
}

variable "trigger_count" {
  description = "trigger count"
  type        = any
}

variable "trigger_percent" {
  description = "trigger percent"
  type        = any
}

variable "slack_auth_token" {
  description = "Slack bot token for the notification channel. Pass it from a secret store, never from code."
  type        = string
  sensitive   = true
}
