# vpc

Terraform module for `vpc`.

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
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_subnetwork.subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| auto\_create\_subnetworks | Value for auto create subnetworks. | `bool` | `false` | no |
| depends\_on\_list | Value for depends on list. | `any` | `[]` | no |
| description | Value for description. | `string` | n/a | yes |
| network\_name | Value for network name. | `string` | n/a | yes |
| routing\_mode | Value for routing mode. | `string` | `"GLOBAL"` | no |
| subnets | Value for subnets. | ```list(object({ subnet_name = string subnet_ip = string subnet_region = string log_config_enabled = bool secondary_ip = list(object({ name = string ip_cidr_range = string })) }))``` | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| network | Network. |
| network\_name | Network name. |
| self\_link | Self link. |
| subnets | Subnets. |
<!-- END_TF_DOCS -->
