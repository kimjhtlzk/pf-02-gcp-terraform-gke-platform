resource "google_monitoring_alert_policy" "monitoring_alert_policy" {
  depends_on   = [google_logging_metric.logging_metric]
  display_name = var.policy_name
  enabled      = "true"
  combiner     = "OR"

  alert_strategy {
    auto_close = "604800s"
  }

  conditions {
    condition_threshold {
      aggregations {
        alignment_period     = var.alignment_period
        cross_series_reducer = "REDUCE_MAX"
        group_by_fields      = ["metadata.system_labels.name"]
        per_series_aligner   = "ALIGN_MAX"
      }

      comparison      = "COMPARISON_GT"
      duration        = var.duration
      filter          = var.policy_filter
      threshold_value = var.threshold_value

      trigger {
        count   = var.trigger_count
        percent = var.trigger_percent
      }
    }

    display_name = "${var.project_id} ${var.policy_name}"
  }

  notification_channels = [google_monitoring_notification_channel.monitoring_notification_channel.name]
}

resource "google_logging_metric" "logging_metric" {
  for_each = { for metric in var.metrics : metric.metric_name => metric }

  name   = each.value.metric_name
  filter = each.value.metric_filter

  metric_descriptor {
    metric_kind = try(each.value.metric_kind, "DELTA")
    unit        = try(each.value.unit, "1")
    value_type  = try(each.value.value_type, "INT64")
  }

}

resource "google_monitoring_notification_channel" "monitoring_notification_channel" {
  display_name = var.channel_name
  enabled      = "true"

  labels = {
    channel_name = "#${var.channel_name}"
  }

  sensitive_labels {
    auth_token = var.slack_auth_token
  }

  type = "slack"
}
