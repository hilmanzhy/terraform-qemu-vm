locals {
  tvmu_ns_name = "tvmu-ns-olt"
}

module "proxmox_vm_ns_olt" {
  source            = "../modules/compute_qemu"
  vm_desc           = "vm use for ns-olt"
  vm_name           = local.tvmu_ns_name
  vm_agent          = 1
  vm_target_node    = "pve"
  vm_os_type        = ""
  vm_qemu_os        = "l26"
  vm_template       = ""
  vm_cpu            = "x86-64-v2-AES"
  vm_cores          = 4
  vm_sockets        = 1
  vm_memory         = 4096

  # disk_id           = 0
  disk_size         = "224"
  disk_backup       = true
  
  network_interfaces = {
    net0 = {
      network_model     = "virtio"
      network_bridge    = "vmbr1"
      network_firewall  = true
      network_tag       = 200
      network_mtu       = 0
      network_queues    = 0
      network_rate      = 0
    },
    net1 = {
      network_model     = "virtio"
      network_bridge    = "vmbr1"
      network_firewall  = true
      network_tag       = 202
      network_mtu       = 0
      network_queues    = 0
      network_rate      = 0
    }
  }
}