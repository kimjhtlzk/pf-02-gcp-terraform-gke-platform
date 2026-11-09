# gcediskasyncreplication

Terraform module for `gcediskasyncreplication`.

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
| [google_compute_disk.primary_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_disk.secondary_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_disk_async_replication.replication](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk_async_replication) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| primary\_disk\_name | primary\_disk\_name | `any` | `null` | no |
| primary\_size | disk\_size | `any` | `null` | no |
| primary\_type | primary\_type | `any` | `"null"` | no |
| primary\_zone | primary\_zone | `any` | `null` | no |
| secondary\_disk\_name | secondary\_disk\_name | `any` | `null` | no |
| secondary\_zone | secondary\_zone | `any` | `null` | no |
| sync\_start | Value for sync start. | `any` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| primary\_disk\_id | Primary disk id. |
| secondary\_disk\_id | Secondary disk id. |
<!-- END_TF_DOCS -->
