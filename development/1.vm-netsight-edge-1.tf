locals {
  tvmu_edge_name = "netsight-edge-1"
}

module "proxmox_vm_netsight_edge_1" {
  source            = "../modules/compute_qemu"
  vm_desc           = "vm for netsight edge 1"
  vm_name           = local.tvmu_edge_name
  vm_agent          = 1
  vm_target_node    = "immobisp"
  iso_file          = "local:iso/ubuntu-24.04-live-server-amd64.iso"
  vm_cores          = 4
  vm_sockets        = 1
  vm_memory         = 2048

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