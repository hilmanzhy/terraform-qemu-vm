locals {
  tvmu_edge_3_name = "netsight-edge-3"
}

module "proxmox_vm_netsight_edge_3" {
  source            = "../modules/compute_qemu"
  vm_desc           = "vm for netsight edge 3"
  vm_name           = local.tvmu_edge_3_name
  vm_agent          = 1
  vm_target_node    = "immobisp"
  iso_file          = "local:img/jammy-server-cloudimg-amd64-disk-kvm.img"
  vm_cores          = 4
  vm_sockets        = 1
  vm_memory         = 2048

  disk_size         = "30"
  disk_backup       = true
  
  network_model     = "virtio"
  network_bridge    = "vmbr0"
  network_mtu       = 0
  network_queues    = 0
  network_rate      = 0
  network_tag       = 200
  network_firewall  = true
}