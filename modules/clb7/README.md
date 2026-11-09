# clb7

Terraform module for `clb7`.

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
| [google_compute_backend_service.backendservice](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service) | resource |
| [google_compute_global_address.pip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_global_forwarding_rule.frontend_forwarding_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_health_check.helthcheck](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check) | resource |
| [google_compute_ssl_certificate.ssl_certificate](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ssl_certificate) | resource |
| [google_compute_target_http_proxy.target_proxy_http](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy) | resource |
| [google_compute_target_https_proxy.target_proxy_https](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_https_proxy) | resource |
| [google_compute_url_map.url_map](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |
| [google_compute_global_address.pip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_global_address) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| backend | Value for backend. | `any` | `null` | no |
| backend\_port | Value for backend port. | `any` | `null` | no |
| backend\_protocol | Value for backend protocol. | `any` | `null` | no |
| connection\_draining\_timeout\_sec | Value for connection draining timeout sec. | `any` | `null` | no |
| consistent\_hash | Value for consistent hash. | `any` | `null` | no |
| forwarding\_rule | Value for forwarding rule. | `any` | `null` | no |
| group | Value for group. | `any` | `null` | no |
| health\_checks | Value for health checks. | `any` | `null` | no |
| load\_balancing\_scheme | Value for load balancing scheme. | `any` | `null` | no |
| locality\_lb\_policy | Value for locality lb policy. | `any` | `null` | no |
| log\_config\_enable | Value for log config enable. | `any` | `null` | no |
| log\_config\_sample\_rate | Value for log config sample rate. | `any` | `null` | no |
| name | Value for name. | `any` | `null` | no |
| session\_affinity | Value for session affinity. | `any` | `null` | no |
| ssl\_certificate | Value for ssl certificate. | `any` | `null` | no |
| target\_proxy | Value for target proxy. | `any` | `null` | no |
| timeout\_sec | Value for timeout sec. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
