# vpcpeering

Terraform module for `vpcpeering`.

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
| [google_compute_network_peering.peering](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_peering) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| destination\_network | Value for destination network. | `any` | `"null"` | no |
| origin\_network | Value for origin network. | `any` | `"null"` | no |
| peer\_name | Value for peer name. | `any` | `"null"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
