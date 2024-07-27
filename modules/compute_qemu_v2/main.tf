terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }
}

resource "null_resource" "download_image" {
  provisioner "file" {
    source      = "/Users/hilmanzhy/research/terraform-qemu-vm/modules/compute_qemu_v2/download.sh"
    destination = "/tmp/download.sh"
    connection {
      type        = "ssh"
      user        = var.pm_user
      private_key = file(var.ssh_private_key_path)
      host        = var.pm_host
      port        = 22
    }
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/download.sh",
      "/tmp/download.sh"
    ]
    connection {
      type        = "ssh"
      user        = var.pm_user
      private_key = file(var.ssh_private_key_path)
      host        = var.pm_host
      port        = 22
    }
  }
}

resource "null_resource" "attach_disk" {
  depends_on = [null_resource.import_disk]
  provisioner "local-exec" {
    command = <<EOT
      ssh -tt -i ${var.ssh_private_key_path} ${var.pm_user}@${var.pm_host} <<EOF
      qm set ${var.vm_id} --scsi1 ${var.vm_storage}:vm-${var.vm_id}-disk-1
      qm set ${var.vm_id} --boot order=scsi1
      exit
    EOT
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "import_disk" {
  depends_on = [proxmox_vm_qemu.vm_instance]
  provisioner "local-exec" {
    command = <<EOT
      ssh -tt -i ${var.ssh_private_key_path} ${var.pm_user}@${var.pm_host} <<EOF
      qm importdisk ${var.vm_id} /var/lib/vz/template/iso/noble-server-cloudimg-amd64.img ${var.vm_storage}
      exit
    EOT
  }
  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "proxmox_vm_qemu" "vm_instance" {
  depends_on      = [null_resource.download_image]
  name            = var.vm_name
  vmid            = var.vm_id
  desc            = var.vm_desc
  target_node     = var.vm_target_node
  full_clone      = false
  boot            = var.vm_boot
  hotplug         = "network,disk,usb"
  numa            = false
  onboot          = true
  os_type         = var.vm_os_type
  qemu_os         = var.vm_qemu_os
  scsihw          = "virtio-scsi-single"
  vm_state        = "stopped"
  cores           = var.vm_cores
  sockets         = var.vm_sockets
  memory          = var.vm_memory
  bootdisk        = "scsi0, scsi1"
  agent           = 1
  sshkeys         = file(var.ssh_public_key_path)
  ciuser          = var.vm_user
  cipassword      = var.vm_password

  disks {
      scsi {
          scsi0 {
              disk {
                  # id                 = var.disk_id
                  backup             = var.disk_backup
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
              cloudinit {
                  storage = var.vm_storage
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
