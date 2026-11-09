# firewall

Terraform module for `firewall`.

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
| [google_compute_firewall.rules](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| rules | Value for rules. | ```map(object({ network = string direction = string action = string ranges = list(string) sources = list(string) targets = list(string) priority = number use_service_accounts = bool enable_logging = bool rules = list(object({ protocol = string ports = list(string) })) }))``` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
