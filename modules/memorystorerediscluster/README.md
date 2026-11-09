# memorystorerediscluster

Terraform module for `memorystorerediscluster`.

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
| [google_redis_cluster.cluster-ha](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/redis_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| authorization\_mode | Value for authorization mode. | `any` | `null` | no |
| name | Value for name. | `any` | `null` | no |
| network | Value for network. | `any` | `null` | no |
| region | Value for region. | `any` | `null` | no |
| replica\_count | Value for replica count. | `any` | `null` | no |
| shard\_count | Value for shard count. | `any` | `null` | no |
| transit\_encryption\_mode | Value for transit encryption mode. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
