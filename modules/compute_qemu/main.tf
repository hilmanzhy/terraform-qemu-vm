terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}


resource "proxmox_vm_qemu" "vm_instance" {
  name                   = var.vm_name
  desc                   = var.vm_desc
  agent                  = var.vm_agent
  target_node            = var.vm_target_node
  # clone                  = var.vm_template
  # iso                    = var.iso_file
  full_clone             = false
  boot                   = var.vm_boot
  hotplug                = "network,disk,usb"
  define_connection_info = false
  numa                   = false
  onboot                 = true
  os_type                = var.vm_os_type
  qemu_os                = var.vm_qemu_os
  scsihw                 = "virtio-scsi-single"
  vm_state               = "running"
  cores                  = var.vm_cores
  cpu                    = var.vm_cpu
  sockets                = var.vm_sockets
  memory                 = var.vm_memory

  disks {
      scsi {
          scsi0 {
              disk {
                  # id                 = var.disk_id
                  backup             = var.disk_backup
                  # cache              = "No cache"
                  discard            = false
                  emulatessd         = false
                  iothread           = true
                  readonly           = false
                  mbps_r_burst       = 0.0
                  mbps_r_concurrent  = 0.0
                  mbps_wr_burst      = 0.0
                  mbps_wr_concurrent = 0.0
                  replicate          = true
                  size               = var.disk_size
                  storage            = var.disk_storage
              }
          }
      }
      ide {
        ide0 {
          cdrom {
            iso = var.iso_file
          }
        }
      }
  }



 dynamic "network" {
    for_each = var.network_interfaces
    content {
      model     = network.value.network_model
      bridge    = network.value.network_bridge
      firewall  = network.value.network_firewall
      tag       = network.value.network_tag
      mtu       = network.value.network_mtu
      queues    = network.value.network_queues
      rate      = network.value.network_rate
      link_down = false
    }
  }
}