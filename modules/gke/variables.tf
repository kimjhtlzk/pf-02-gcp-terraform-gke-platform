variable "gke_cluster" {
  description = "클러스터 이름"
  type        = string
}

variable "region" {
  description = "클러스터기 위치하는 리전"
  type        = string
  default     = "asia-northeast3"
}

variable "network" {
  description = "VPC 이름"
  type        = string
}

variable "managed_prometheus" {
  description = "managed_prometheus 사용 유무"
  type        = string
}

variable "subnetwork" {
  description = "서브넷"
  type        = any
}

variable "ip_allocation" {
  description = "pod와 service 가 배치될 서브넷의 Secondary IP 입력"
  type = object({
    pods     = string
    services = string
  })
}

variable "master_ipv4_cidr_block" {
  description = "Control Plain이 배치 될 IP 주소 (10.x.x.x/28)"
  type        = string
}

variable "enable_private_nodes" {
  description = "Value for enable private nodes."
  type        = any
  default     = null
}

variable "master_authorized_networks" {
  description = "Value for master authorized networks."
  type        = any
  default     = []
}

variable "node_zones" {
  description = "노드가 배치될 존 입력. 배열로 여러개 지정 가능 (규칙: 라운드로빈)"
  type        = list(string)
  default     = ["a"]
}

variable "node_pool" {
  description = "노드 풀의 스펙"
  type        = any
}

variable "service_account" {
  description = "GKE 배포용 서비스 계정 입력"
  type        = string
}

variable "network_policy" {
  description = "네트워크 정책 적용 클러스터"
  type        = bool
  default     = true
}

variable "node_version" {
  description = "Value for node version."
  type        = any
  default     = false
}

variable "deletion_protection" {
  description = "GKE 삭제 보호 설정"
  type        = bool
  default     = true
}

variable "labels" {
  description = "Labels applied to the cluster."
  type        = map(string)
  default = {
    managed-by = "terraform"
  }
}

variable "binary_authorization_mode" {
  description = "Binary Authorization evaluation mode. The project policy decides which images may run."
  type        = string
  default     = "PROJECT_SINGLETON_POLICY_ENFORCE"
}
