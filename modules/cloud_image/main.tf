locals {
  ci_filename = replace(reverse(split("/", var.image_url))[0], "qcow2", "img")
}

resource "proxmox_virtual_environment_download_file" "ci" {
  content_type = "iso"
  datastore_id = var.image_datastore
  node_name    = var.node_name
  url          = var.image_url
  file_name    = local.ci_filename
}
