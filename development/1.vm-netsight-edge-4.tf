locals {
  tvmu_edge_name_4 = "netsight-edge-4"
}

module "proxmox_vm_netsight_edge_4" {
  source            = "../modules/compute_qemu_v2"
  pm_host           = var.vm_host
  pm_user           = var.vm_username
  vm_desc           = "vm for netsight edge 4"
  vm_name           = local.tvmu_edge_name_4
  vm_id             = 1004
  vm_agent          = 1
  vm_target_node    = var.vm_node_name
  iso_file          = "local:iso/ubuntu-24.04-live-server-amd64.iso"
  vm_cores          = 2
  vm_sockets        = 1
  vm_memory         = 2048
  # vm_boot           = "scsi0"
  vm_os_type        = "cloud-init"
  disk_size         = "30"
  disk_backup       = true
  network_interfaces = [
    {
      network_model     = "virtio"
      network_bridge    = "vmbr3"
      network_mtu       = 0
      network_queues    = 0
      network_rate      = 0
      network_tag       = null
      network_firewall  = true
    }
  ]
  image_path        = "/root/ubuntu-24-amd64.img"
  image_url         = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  vm_user           = var.vm_user
  vm_password       = var.vm_password
  vm_ipconfig       = "ip=dhcp"
}