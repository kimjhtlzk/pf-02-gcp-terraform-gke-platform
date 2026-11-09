resource "google_compute_instance" "vm_instance" {
  #checkov:skip=CKV_GCP_38:Google-managed encryption is the default. A customer-supplied key would add a key lifecycle this reference does not own.
  name             = var.name
  zone             = "${var.region}-${var.zone}"
  machine_type     = var.machine_type
  min_cpu_platform = var.min_cpu_platform
  hostname         = "${var.name}.${var.domain}"

  resource_policies = var.resource_policies != null ? [var.resource_policies, ] : null

  network_interface {
    network    = var.network
    subnetwork = var.subnet
    network_ip = var.network_ip

    dynamic "access_config" {
      for_each = var.private ? {} : { "0" = null }

      content {
        nat_ip = var.ipaddress == "null" ? google_compute_address.external[0].address : data.google_compute_address.external[0].address
      }
    }
  }

  service_account {
    email  = var.service_account.email
    scopes = var.service_account.scopes
  }

  shielded_instance_config {
    enable_secure_boot          = var.enable_secure_boot
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }

  dynamic "boot_disk" {
    for_each = var.boot_disk
    iterator = disk

    content {
      auto_delete = "true"
      initialize_params {
        size  = lookup(disk.value, "size", null)
        image = lookup(disk.value, "image", null)
        type  = lookup(disk.value, "type", null)
      }
    }
  }

  dynamic "scratch_disk" {
    for_each = var.scratch_disk != null ? [1] : []
    content {
      interface = var.scratch_disk
    }
  }

  dynamic "attached_disk" {
    for_each = var.attached_disk
    iterator = disk

    content {
      source = disk.value.async != "" ? disk.value.async : google_compute_disk.additional_disk[disk.key].id
    }

  }

  allow_stopping_for_update = true
  deletion_protection       = try(var.deletion_protection, true)

  tags = var.tags

  metadata = {
    ssh-keys               = var.ssh_keys == "null" ? null : "${var.ssh_keys_user}:${file(var.ssh_keys)}"
    block-project-ssh-keys = var.block_project_ssh_keys
  }

  depends_on = [var.depends_on_list]
}

resource "google_compute_disk" "additional_disk" {
  #checkov:skip=CKV_GCP_37:Google-managed encryption is the default. A customer-supplied key would add a key lifecycle this reference does not own.
  for_each = { for k, v in var.attached_disk : k => v if v.async == "" }

  name  = "${var.name}-${each.key}"
  type  = each.value.type
  size  = each.value.size
  image = each.value.image
  zone  = "${var.region}-${var.zone}"
}

data "google_compute_address" "external" {
  count = var.ipaddress == "null" ? 0 : 1

  name   = var.ipaddress
  region = var.region
}

resource "google_compute_address" "external" {
  count = var.private == false && var.ipaddress == "null" ? 1 : 0

  name         = "${var.name}-external"
  region       = var.region
  address_type = "EXTERNAL"
  network_tier = "PREMIUM"
}
