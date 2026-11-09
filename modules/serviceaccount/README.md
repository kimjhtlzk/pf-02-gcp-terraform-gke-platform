# serviceaccount

Terraform module for `serviceaccount`.

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
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| description | Value for description. | `string` | `null` | no |
| id | Value for id. | `string` | `null` | no |
| name | Value for name. | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| account\_id | Account id. |
| email | Email. |
<!-- END_TF_DOCS -->
