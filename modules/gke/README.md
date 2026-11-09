# gke

Terraform module for `gke`.

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
| [google_container_cluster.gke](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_cluster) | resource |
| [google_container_node_pool.node_pool](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/container_node_pool) | resource |
| [google_project.current](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| binary\_authorization\_mode | Binary Authorization evaluation mode. The project policy decides which images may run. | `string` | `"PROJECT_SINGLETON_POLICY_ENFORCE"` | no |
| deletion\_protection | GKE 삭제 보호 설정 | `bool` | `true` | no |
| enable\_private\_nodes | Value for enable private nodes. | `any` | `null` | no |
| gke\_cluster | 클러스터 이름 | `string` | n/a | yes |
| ip\_allocation | pod와 service 가 배치될 서브넷의 Secondary IP 입력 | ```object({ pods = string services = string })``` | n/a | yes |
| labels | Labels applied to the cluster. | `map(string)` | ```{ "managed-by": "terraform" }``` | no |
| managed\_prometheus | managed\_prometheus 사용 유무 | `string` | n/a | yes |
| master\_authorized\_networks | Value for master authorized networks. | `any` | `[]` | no |
| master\_ipv4\_cidr\_block | Control Plain이 배치 될 IP 주소 (10.x.x.x/28) | `string` | n/a | yes |
| network | VPC 이름 | `string` | n/a | yes |
| network\_policy | 네트워크 정책 적용 클러스터 | `bool` | `true` | no |
| node\_pool | 노드 풀의 스펙 | `any` | n/a | yes |
| node\_version | Value for node version. | `any` | `false` | no |
| node\_zones | 노드가 배치될 존 입력. 배열로 여러개 지정 가능 (규칙: 라운드로빈) | `list(string)` | ```[ "a" ]``` | no |
| region | 클러스터기 위치하는 리전 | `string` | `"asia-northeast3"` | no |
| service\_account | GKE 배포용 서비스 계정 입력 | `string` | n/a | yes |
| subnetwork | 서브넷 | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
