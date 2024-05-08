locals {
  tvmu_ns_olt_up_name = "tvmu-ns-olt-up"
}

module "proxmox_vm_ns_olt_up" {
  source            = "../modules/compute_qemu"
  vm_desc           = "vm use for ns-olt"
  vm_name           = local.tvmu_ns_name
  vm_agent          = 1
  vm_target_node    = "pve"
  vm_template       = "template-ubuntu"
  vm_cores          = 4
  vm_sockets        = 1
  vm_memory         = 4096

  disk_size         = "30"
  disk_backup       = true
  
  network_model     = "virtio"
  network_bridge    = "vmbr1"
  network_mtu       = 0
  network_queues    = 0
  network_rate      = 0
  network_tag       = 200
  network_firewall  = true
}