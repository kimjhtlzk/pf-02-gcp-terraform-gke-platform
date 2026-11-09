# clouddns

Terraform module for `clouddns`.

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
| [google_dns_managed_zone.private-zone](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/dns_managed_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| cloud\_dns\_name | Value for cloud dns name. | `any` | `null` | no |
| dns\_name | Value for dns name. | `any` | `null` | no |
| network | Value for network. | `any` | `null` | no |
| visibility | Value for visibility. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
