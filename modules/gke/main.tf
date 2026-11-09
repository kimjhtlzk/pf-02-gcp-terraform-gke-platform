data "google_project" "current" {}

resource "google_container_cluster" "gke" {
  #checkov:skip=CKV_GCP_65:Google Groups for RBAC needs an organization group domain, which differs per adopter.
  #checkov:skip=CKV_GCP_69:The default node pool is removed. Every managed node pool sets the GKE metadata server below.
  name = var.gke_cluster

  location                 = var.region
  node_locations           = [for zone in var.node_zones : "${var.region}-${zone}"]
  min_master_version       = var.node_version
  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection      = var.deletion_protection

  enable_intranode_visibility = true
  resource_labels             = var.labels

  master_auth {
    client_certificate_config {
      issue_client_certificate = false
    }
  }

  workload_identity_config {
    workload_pool = "${data.google_project.current.project_id}.svc.id.goog"
  }

  binary_authorization {
    evaluation_mode = var.binary_authorization_mode
  }

  release_channel {
    channel = "STABLE"
  }

  network    = var.network
  subnetwork = var.subnetwork.id

  ip_allocation_policy {
    cluster_secondary_range_name  = var.ip_allocation.pods
    services_secondary_range_name = var.ip_allocation.services
  }

  dynamic "private_cluster_config" {
    for_each = var.enable_private_nodes ? [1] : []

    content {
      enable_private_nodes    = true
      enable_private_endpoint = false
      master_ipv4_cidr_block  = var.master_ipv4_cidr_block
    }
  }

  dynamic "master_authorized_networks_config" {
    for_each = var.master_authorized_networks != null ? [1] : []

    content {
      dynamic "cidr_blocks" {
        for_each = var.master_authorized_networks
        iterator = access

        content {
          display_name = access.value.name
          cidr_block   = access.value.ip_cidr
        }
      }
    }
  }

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
    managed_prometheus {
      enabled = var.managed_prometheus
    }
  }

  addons_config {
    gce_persistent_disk_csi_driver_config {
      enabled = true
    }
    network_policy_config {
      disabled = !var.network_policy
    }
  }
  network_policy {
    enabled  = var.network_policy
    provider = var.network_policy ? "CALICO" : "PROVIDER_UNSPECIFIED"
  }

  lifecycle {
    ignore_changes = [maintenance_policy]
  }

}

resource "google_container_node_pool" "node_pool" {
  for_each = var.node_pool

  name       = each.key
  cluster    = google_container_cluster.gke.id
  node_count = each.value.autoscaling_enable == true ? null : each.value.node_count
  version    = each.value.pool_version

  dynamic "autoscaling" {
    for_each = each.value.autoscaling_enable ? [1] : []
    content {
      min_node_count  = each.value.min_node_count
      max_node_count  = each.value.max_node_count
      location_policy = each.value.location_policy
    }
  }

  node_config {
    image_type      = "COS_CONTAINERD"
    machine_type    = try(each.value.machine_type, "custom-${each.value.cpu}-${each.value.memory * 1024}-ext")
    disk_type       = try(each.value.disk_type, "pd-ssd")
    disk_size_gb    = try(each.value.disk_size_gb, "100")
    service_account = var.service_account

    tags = each.value.tags

    metadata = {
      disable-legacy-endpoints = "true"
    }

    workload_metadata_config {
      mode = "GKE_METADATA"
    }

    shielded_instance_config {
      enable_integrity_monitoring = true
      enable_secure_boot          = true
    }
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }

  dynamic "upgrade_settings" {
    for_each = [each.value]
    content {
      strategy        = each.value.strategy[0]
      max_surge       = each.value.max_surge
      max_unavailable = each.value.max_unavailable
      dynamic "blue_green_settings" {
        for_each = each.value.strategy[0] == "SURGE" ? [] : [1]
        content {
          node_pool_soak_duration = each.value.node_pool_soak_duration
          standard_rollout_policy {
            batch_node_count    = each.value.batch_node_count
            batch_soak_duration = each.value.batch_soak_duration
          }
        }
      }
    }
  }

  node_locations = try(each.value.node_locations, null)

}
