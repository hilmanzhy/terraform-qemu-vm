output "vm_ids" {
  value = proxmox_vm_qemu.vm_instance.*.id
}
