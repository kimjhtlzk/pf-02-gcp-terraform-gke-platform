# storagebucket

Terraform module for `storagebucket`.

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
| [google_storage_bucket.cloud_storage](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.member](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| bucket\_name | Value for bucket name. | `any` | `null` | no |
| force\_destroy | Value for force destroy. | `any` | `null` | no |
| lifecycle\_rule | Value for lifecycle rule. | `any` | `null` | no |
| location | Value for location. | `any` | `null` | no |
| soft\_delete\_retention\_seconds | How long deleted objects stay recoverable. Use 0 to turn soft delete off. | `number` | `604800` | no |
| storage\_bucket\_iam\_member | Map of IAM members for the storage bucket | ```map(object({ member = string role = string }))``` | `{}` | no |
| storage\_class | Value for storage class. | `any` | `null` | no |
| uniform\_bucket\_level\_access | Value for uniform bucket level access. | `any` | `null` | no |
| versioning | Keep previous object versions. | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
