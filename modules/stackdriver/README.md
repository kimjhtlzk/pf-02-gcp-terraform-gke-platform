# stackdriver

Terraform module for `stackdriver`.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.9, < 2.0 |
| google | >= 6.0, < 7.0 |

## Providers

| Name | Version |
| ---- | ------- |
| google | >= 6.0, < 7.0 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [google_logging_metric.logging_metric](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/logging_metric) | resource |
| [google_monitoring_alert_policy.monitoring_alert_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |
| [google_monitoring_notification_channel.monitoring_notification_channel](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_notification_channel) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| alignment\_period | alignment period | `any` | n/a | yes |
| channel\_name | total channel name | `any` | n/a | yes |
| duration | duration | `any` | n/a | yes |
| metrics | logging metrics | `any` | n/a | yes |
| policy\_filter | policy filter | `any` | n/a | yes |
| policy\_name | policy name & bot name | `any` | n/a | yes |
| project\_id | project id | `any` | n/a | yes |
| slack\_auth\_token | Slack bot token for the notification channel. Pass it from a secret store, never from code. | `string` | n/a | yes |
| threshold\_value | threshold value | `any` | n/a | yes |
| trigger\_count | trigger count | `any` | n/a | yes |
| trigger\_percent | trigger percent | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
