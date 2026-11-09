# c2sfirewall

Terraform module for `c2sfirewall`.

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
| management\_ports | TCP ports reachable only from the VPN source ranges. | `list(string)` | ```[ "22", "3389", "6379" ]``` | no |
| network | vpc id | `string` | n/a | yes |
| vpn\_source\_ranges | Source ranges of the client-to-site VPN that may reach management ports. | `list(string)` | ```[ "203.0.113.10/32" ]``` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
