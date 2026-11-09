# artifactregistry

Terraform module for `artifactregistry`.

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
| [google_artifact_registry_repository.artifact_registry](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/artifact_registry_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| artifact\_registry\_name | Value for artifact registry name. | `any` | `null` | no |
| cleanup\_policies | Value for cleanup policies. | ```list(object({ id = string action = string condition = optional(object({ tag_state = optional(string) tag_prefixes = optional(list(string)) older_than = optional(string) newer_than = optional(string) version_name_prefixes = optional(list(string)) package_name_prefixes = optional(list(string)) })) most_recent_versions = optional(object({ keep_count = optional(number) package_name_prefixes = optional(list(string)) })) }))``` | `[]` | no |
| format | Value for format. | `any` | `null` | no |
| location | Value for location. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
