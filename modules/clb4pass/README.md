# clb4pass

Terraform module for `clb4pass`.

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
| [google_compute_address.pip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_forwarding_rule.forwarding_rule](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_forwarding_rule) | resource |
| [google_compute_region_backend_service.backend_service](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_backend_service) | resource |
| [google_compute_region_health_check.backend_health_check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_region_health_check) | resource |
| [google_compute_address.pip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_address) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| backend | Value for backend. | `any` | `null` | no |
| connection\_draining\_timeout\_sec | Value for connection draining timeout sec. | `any` | `null` | no |
| forwarding\_rule | Value for forwarding rule. | `any` | `null` | no |
| frontend\_ip | Value for frontend ip. | `any` | `null` | no |
| health\_checks | Value for health checks. | `any` | `null` | no |
| ip\_address | Value for ip address. | `any` | `null` | no |
| load\_balancing\_scheme | Value for load balancing scheme. | `any` | `null` | no |
| locality\_lb\_policy | Value for locality lb policy. | `any` | `null` | no |
| log\_config\_enable | Value for log config enable. | `any` | `null` | no |
| log\_config\_sample\_rate | Value for log config sample rate. | `any` | `null` | no |
| name | Value for name. | `any` | `null` | no |
| network | Value for network. | `any` | `null` | no |
| protocol | Value for protocol. | `any` | `null` | no |
| region | Value for region. | `any` | `null` | no |
| session\_affinity | Value for session affinity. | `any` | `null` | no |
| shared\_ip | Value for shared ip. | `any` | `null` | no |
| subnetwork | Value for subnetwork. | `any` | `null` | no |
| timeout\_sec | Value for timeout sec. | `any` | `null` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
