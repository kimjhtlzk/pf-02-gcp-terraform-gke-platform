# gce

Terraform module for `gce`.

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
| [google_compute_address.external](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_disk.additional_disk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_instance.vm_instance](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [google_compute_address.external](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_address) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| attached\_disk | VM Instance additional disk | `any` | `null` | no |
| block\_project\_ssh\_keys | Value for block project ssh keys. | `any` | `null` | no |
| boot\_disk | VM Instance boot disk | `any` | `null` | no |
| deletion\_protection | Value for deletion protection. | `any` | `true` | no |
| depends\_on\_list | Dependency list | `list(any)` | `[]` | no |
| domain | Domain name | `any` | `"example.com"` | no |
| enable\_secure\_boot | Turn on Secure Boot for the instance. Disable only for images with unsigned kernel modules. | `bool` | `true` | no |
| ipaddress | Public IP Address Name | `any` | `null` | no |
| machine\_type | VM Instanse machine type | `any` | n/a | yes |
| min\_cpu\_platform | VM Instance cpu platform | `any` | `"Intel Skylake"` | no |
| name | VM Instance name | `any` | `null` | no |
| network | network ID | `any` | `null` | no |
| network\_ip | Subnetwork IP | `any` | `null` | no |
| private | Do not create Public IP | `any` | `false` | no |
| region | Region | `any` | `null` | no |
| resource\_policies | Value for resource policies. | `any` | `null` | no |
| scratch\_disk | Value for scratch disk. | `any` | `null` | no |
| service\_account | Service Account info | ```object({ email = string scopes = list(string) })``` | ```{ "email": null, "scopes": [ "cloud-platform" ] }``` | no |
| ssh\_keys | Value for ssh keys. | `any` | `null` | no |
| ssh\_keys\_user | Value for ssh keys user. | `any` | `null` | no |
| subnet | Subnet ID | `any` | `null` | no |
| tags | Resource Tags | `list(any)` | `[]` | no |
| zone | Zone | `string` | `"a"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| self\_link | Self link. |
<!-- END_TF_DOCS -->
