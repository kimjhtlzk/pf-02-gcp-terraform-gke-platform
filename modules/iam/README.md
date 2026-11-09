# iam

Terraform module for `iam`.

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
| [google_project_iam_member.binding_roles](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| binding\_roles | Attach role list | `list(string)` | `[]` | no |
| custom\_role\_ids | Created custom role IDs | `any` | `null` | no |
| depends\_on\_list | Value for depends on list. | `any` | `[]` | no |
| email | User email | `string` | `null` | no |
| project | Project ID | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| iam\_roles | Iam roles. |
<!-- END_TF_DOCS -->
