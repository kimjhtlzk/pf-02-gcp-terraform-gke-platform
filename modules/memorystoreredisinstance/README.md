# memorystoreredisinstance

Terraform module for `memorystoreredisinstance`.

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
| [google_redis_instance.memorystore_redis](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| alternative\_location\_id | Value for alternative location id. | `any` | `null` | no |
| auth\_enabled | Value for auth enabled. | `any` | `null` | no |
| authorized\_network | Value for authorized network. | `any` | `null` | no |
| connect\_mode | Value for connect mode. | `any` | `null` | no |
| location\_id | Value for location id. | `any` | `null` | no |
| maintenance\_policy | Value for maintenance policy. | `any` | `null` | no |
| memory\_size\_gb | Value for memory size gb. | `any` | `null` | no |
| name | Value for name. | `any` | `null` | no |
| read\_replicas\_mode | Value for read replicas mode. | `any` | `null` | no |
| redis\_version | Value for redis version. | `any` | `null` | no |
| replica\_count | Value for replica count. | `any` | `null` | no |
| reserved\_ip\_range | Value for reserved ip range. | `any` | `null` | no |
| tier | Value for tier. | `any` | `null` | no |
| transit\_encryption\_mode | Value for transit encryption mode. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
