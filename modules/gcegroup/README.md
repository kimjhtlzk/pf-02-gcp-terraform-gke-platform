# gcegroup

Terraform module for `gcegroup`.

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
| [google_compute_health_check.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check) | resource |
| [google_compute_instance_group.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance_group) | resource |
| [google_compute_ssl_certificate.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ssl_certificate) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| depends\_on\_list | Value for depends on list. | `any` | `[]` | no |
| groups | Value for groups. | ```map(object({ zone = string network = string instances = list(string) named_ports = list(object({ protocol = string port = number })) }))``` | `{}` | no |
| health | Value for health. | ```map(object({ protocol = string check_interval_sec = number timeout_sec = number healthy_threshold = number unhealthy_threshold = number check = list(object({ port = string path = string header = string })) }))``` | `{}` | no |
| ssl | Value for ssl. | ```list(object({ sslkey_name = string private_key = string certificate = string }))``` | `[]` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| manager | Manager. |
<!-- END_TF_DOCS -->
