# publicip

Terraform module for `publicip`.

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
| [google_compute_address.regional](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_global_address.global](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| name | Public IP Address Name | `string` | n/a | yes |
| region | Public IP Address region | `string` | n/a | yes |
| type | IP Type on Global (Default: regional) | `any` | `"regional"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| ip\_address | Ip address. |
| name | Name. |
| type | Type. |
<!-- END_TF_DOCS -->
