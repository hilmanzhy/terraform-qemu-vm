locals {
  tvmu_edge_name_5 = "netsight-edge-5"
}

module "proxmox_vm_netsight_edge_5" {
  source            = "../modules/compute_qemu_v2"
  pm_host           = var.vm_host
  pm_user           = var.vm_username
  vm_desc           = "vm for netsight edge 1"
  vm_name           = local.tvmu_edge_name_5
  vm_id             = 1001
  vm_agent          = 1
  vm_target_node    = "immobisp"
  iso_file          = "local:iso/ubuntu-24.04-live-server-amd64.iso"
  vm_cores          = 2
  vm_sockets        = 1
  vm_memory         = 2048
  # vm_boot           = "scsi0"
  vm_os_type           = "cloud-init"
  disk_size         = "30"
  disk_backup       = true
  network_model     = "virtio"
  network_bridge    = "vmbr1"
  network_mtu       = 0
  network_queues    = 0
  network_rate      = 0
  network_tag       = 200
  network_firewall  = true
  vm_user           = var.vm_user
  vm_password       = var.vm_password
}