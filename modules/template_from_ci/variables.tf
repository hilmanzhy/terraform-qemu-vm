variable "vm_id" {
  type        = number
  description = "Sets the virtual machine id (>= 100)"
}

variable "template_name" {
  type        = string
  description = "Template name"
}

variable "node_name" {
  type        = string
  description = "Node name"
}
variable "datastore_id" {
  type        = string
  description = "The datastore which the disk will live into"
}

variable "cpu_type" {
  type        = string
  description = "Set the cpu type"
  default     = "host"
}

variable "cpu_units" {
  type        = number
  description = "Set the cpu units. For cgroups v2, defaults to 100"
  default     = 100
}

variable "disk_size" {
  type        = number
  description = "Size of the disk (scsi0)"
  default     = 20
}

variable "disk_interface" {
  type        = string
  description = "Set the root disk interface"
  default     = "scsi0"
}

variable "scsi_hardware" {
  type        = string
  description = "Set the scsi hardware setting"
  default     = "virtio-scsi-single"
}

variable "bridge_interface" {
  type        = string
  description = "The bridge interface for the default nic"
  default     = "vmbr0"
}

variable "cloud_image_id" {
  type        = string
  description = "The id of the cloud image"
}

variable "user_name" {
  type        = string
  description = "The default user for the template"
}

variable "public_keys" {
  type        = list(string)
  description = "The list of public key file paths to be injected to the template"
}
