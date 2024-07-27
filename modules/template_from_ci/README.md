<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | 0.61.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | 0.61.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_vm.template](https://registry.terraform.io/providers/bpg/proxmox/0.61.1/docs/resources/virtual_environment_vm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bridge_interface"></a> [bridge\_interface](#input\_bridge\_interface) | The bridge interface for the default nic | `string` | `"vmbr0"` | no |
| <a name="input_cloud_image_id"></a> [cloud\_image\_id](#input\_cloud\_image\_id) | The id of the cloud image | `string` | n/a | yes |
| <a name="input_cpu_type"></a> [cpu\_type](#input\_cpu\_type) | Set the cpu type | `string` | `"host"` | no |
| <a name="input_cpu_units"></a> [cpu\_units](#input\_cpu\_units) | Set the cpu units. For cgroups v2, defaults to 100 | `number` | `100` | no |
| <a name="input_datastore_id"></a> [datastore\_id](#input\_datastore\_id) | The datastore which the disk will live into | `string` | n/a | yes |
| <a name="input_disk_interface"></a> [disk\_interface](#input\_disk\_interface) | Set the root disk interface | `string` | `"scsi0"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Size of the disk (scsi0) | `number` | `20` | no |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | Node name | `string` | n/a | yes |
| <a name="input_public_keys"></a> [public\_keys](#input\_public\_keys) | The list of public key file paths to be injected to the template | `list(string)` | n/a | yes |
| <a name="input_scsi_hardware"></a> [scsi\_hardware](#input\_scsi\_hardware) | Set the scsi hardware setting | `string` | `"virtio-scsi-single"` | no |
| <a name="input_template_name"></a> [template\_name](#input\_template\_name) | Template name | `string` | n/a | yes |
| <a name="input_user_name"></a> [user\_name](#input\_user\_name) | The default user for the template | `string` | n/a | yes |
| <a name="input_vm_id"></a> [vm\_id](#input\_vm\_id) | Sets the virtual machine id (>= 100) | `number` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->