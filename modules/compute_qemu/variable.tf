variable "instance_count" {
  description = "Number of instances to create"
  type        = number
  default     = 1
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "vm_desc" {
  description = "Description of the VM"
  type        = string
  default      = "VM Testing"
}

variable "vm_agent" {
  description = "Name of the VM"
  type        = number
}

variable "vm_boot" {
  description = "Name of the VM"
  type        = string
  default     = "order=scsi0;ide2;net0"
}

variable "vm_qemu_os" {
  description = "Name of the VM"
  type        = string
  default     = "l26"
}

variable "vm_target_node" {
  description = "Proxmox node to target"
  type        = string
  default     = "value"
}

variable "vm_template" {
  description = "Template to clone VM from"
  type        = string
  default     = "value"
}

variable "vm_os_type" {
  description = "os VM type"
  type        = string
  default     = "Linux"
}

variable "vm_cores" {
  description = "Number of CPU cores"
  type        = number
  default     = 2
}

variable "vm_cpu" {
  description = "CPU type"
  type        = string
  default     = "host"
}

variable "vm_sockets" {
  description = "Number of CPU sockets"
  type        = number
  default     = 1
}

variable "vm_memory" {
  description = "Amount of memory in MB"
  type        = number
  default     = 2048
}

variable "disk_id" {
  description = "type of the disk"
  type        = number
  default     = 0
}

variable "disk_size" {
  description = "Size of the disk in GB"
  type        = number
  default     = 20
}

variable "disk_type" {
  description = "type of the disk"
  type        = string
  default     = "virtio"
}

variable "disk_backup" {
  description = "type of the disk"
  type        = bool
  default     = true
}

variable "disk_storage" {
  description = "storage of the disk"
  type        = string
  default     = "local-lvm"
}

variable "network_interfaces" {
  description = "Map of network interfaces"
  type = map(object({
    network_model     = string
    network_bridge    = string
    network_firewall  = bool
    network_tag       = number
    network_mtu       = number
    network_queues    = number
    network_rate      = number
  }))
  default = {
    net0 = {
      network_model     = "virtio"
      network_bridge    = "vmbr0"
      network_firewall  = true
      network_tag       = 100
      network_mtu       = 1500
      network_queues    = 2
      network_rate      = 1000
    }
  }
}


variable "network_model" {
  description = "Model of the network adapter"
  type        = string
  default     = "virtio"
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "network_tag" {
  description = "Network tag"
  type        = number
  default     = 0
}

variable "network_mtu" {
  description = "Network mtu"
  type        = number
  default     = 0
}

variable "network_queues" {
  description = "Network mtu"
  type        = number
  default     = 0
}

variable "network_rate" {
  description = "Network mtu"
  type        = number
  default     = 0
}

variable "network_firewall" {
  description = "Network firewall"
  type        = bool
  default     = true
}
