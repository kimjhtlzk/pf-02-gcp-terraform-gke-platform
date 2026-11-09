# gceresourcepolicy

Terraform module for `gceresourcepolicy`.

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
| [google_compute_resource_policy.resource_policy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_resource_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| name | Value for name. | `any` | `null` | no |
| policy | Value for policy. | `any` | `null` | no |
| region | Value for region. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
