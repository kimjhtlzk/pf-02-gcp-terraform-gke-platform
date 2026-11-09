# clb4proxy

Terraform module for `clb4proxy`.

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
| [google_compute_backend_service.backend](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service) | resource |
| [google_compute_global_address.pip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_global_forwarding_rule.fd_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_health_check.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check) | resource |
| [google_compute_ssl_certificate.ssl_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ssl_certificate) | resource |
| [google_compute_target_ssl_proxy.ssl_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_ssl_proxy) | resource |
| [google_compute_target_tcp_proxy.tcp_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_tcp_proxy) | resource |
| [google_compute_global_address.pip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_global_address) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| backend\_name | Value for backend name. | `any` | `null` | no |
| backend\_pool | Value for backend pool. | `any` | `null` | no |
| backend\_port | Value for backend port. | `any` | `null` | no |
| connection\_draining\_timeout\_sec | Value for connection draining timeout sec. | `any` | `null` | no |
| forwarding\_rule | Value for forwarding rule. | `any` | `null` | no |
| group | Value for group. | `any` | `null` | no |
| health\_checks | Value for health checks. | `any` | `null` | no |
| load\_balancing\_scheme | Value for load balancing scheme. | `any` | `null` | no |
| name | Value for name. | `any` | `null` | no |
| proxy\_name | Value for proxy name. | `any` | `null` | no |
| proxy\_rule | Value for proxy rule. | `any` | `null` | no |
| session\_affinity | Value for session affinity. | `any` | `null` | no |
| ssl\_certificate | Value for ssl certificate. | `any` | `null` | no |
| timeout\_sec | Value for timeout sec. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
