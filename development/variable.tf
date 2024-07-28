variable "pm_host" {
  description = "Proxmox API host"
  type        = string
}

variable "pm_user" {
  description = "Proxmox API user"
  type        = string
}

variable "vm_host" {
  type = string
}

variable "vm_username" {
  type = string
}

variable "vm_user" {
  type = string
}

variable "vm_password" {
  type = string
}

variable "pm_password" {
  description = "Proxmox API password"
  type        = string
}

variable "pve_api_token" {
  type        = string
  description = "PVE user API token"
  default     = "value"
}

variable "pve_api_endpoint" {
  type        = string
  description = "PVE API url (e.g. https://pve.example.com:8006/)"
  default     = "https://default.com:8006"
}

variable "node_name" {
  type        = string
  description = "PVE Node name"
  default     = "testing"
}

variable "vm_node_name" {
  type        = string
  description = "PVE Node name"
  default     = "testing"
}

variable "node_ip_address" {
  type        = string
  description = "PVE Node IP address"
  default     = "0.0.0.0"
}

variable "node_username" {
  type        = string
  description = "PVE Node privileged username"
  default     = "testing"
}

variable "node_user_privatekey_path" {
  type        = string
  description = "PVE Node user private key file path"
  default     = "value"
}

variable "public_keys" {
  type        = list(string)
  description = "Public keys to be injected to the template VM"
  default = [ "/Users/hilmanzhy/.ssh/hilmanzhy_rsa.pub" ]
}

variable "image_path" {
  type        = string
  description = "image path downloaded"
  default     = "/root"
}

variable "image_url" {
  type        = string
  description = "image url downloaded"
  default     = "ubuntu-24.04"
}
