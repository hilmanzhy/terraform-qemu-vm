locals {
  public_keys = [for path in var.public_keys : file(path)]
}

resource "proxmox_virtual_environment_vm" "template" {
  vm_id     = var.vm_id
  name      = var.template_name
  node_name = var.node_name

  tablet_device = false

  agent {
    enabled = true
    trim    = true
  }

  cpu {
    cores = 1
    type  = var.cpu_type
    units = var.cpu_units
  }

  memory {
    dedicated = 1024
  }

  serial_device {
    device = "socket"
  }

  vga {
    type = "serial0"
  }

  scsi_hardware = var.scsi_hardware

  disk {
    datastore_id = var.datastore_id
    file_id      = var.cloud_image_id
    interface    = var.disk_interface
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  network_device {
    bridge = var.bridge_interface
  }

  initialization {
    datastore_id = var.datastore_id
    user_account {
      username = var.user_name
      keys     = local.public_keys
    }
  }

  template = true
}
