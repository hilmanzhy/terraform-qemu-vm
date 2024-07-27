module "ci_rocky_9" {
  source = "../modules/cloud_image"

  node_name       = var.node_name
  image_url       = "https://"
  image_datastore = "local-lvm"
}

module "ci_ubuntu_24_04" {
  source = "../modules/cloud_image"

  node_name       = var.node_name
  image_url       = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
  image_datastore = "local-lvm"
}

module "tmpl_rocky_9" {
  source = "../modules/template_from_ci"

  node_name      = var.node_name
  vm_id          = 9010
  template_name  = "tmpl-rocky9"
  datastore_id   = "local"
  cloud_image_id = module.ci_rocky_9.id
  user_name      = "cloud"
  public_keys    = var.public_keys
}

module "vm_netsight_testing" {
  source = "../modules/template_from_ci"

  node_name      = var.node_name
  vm_id          = 9010
  template_name  = "ubuntu-24.04"
  datastore_id   = "local-lvm"
  cloud_image_id = module.ci_ubuntu_24_04.id
  user_name      = "cloud"
  public_keys    = var.public_keys
}