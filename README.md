
# Terraform Proxmox QEMU VM Module

This project provides Terraform configurations for provisioning virtual machines using the Proxmox QEMU provider. It is designed to help you quickly deploy and manage VMs in a Proxmox environment using Terraform.

## Prerequisites

Before you begin, ensure you have the following prerequisites installed and configured:

- Proxmox VE installed and accessible.
- Terraform v0.13+ installed on your machine.
- Proper credentials (API token or username and password) with sufficient permissions configured in Proxmox.

## Quick Start

Follow these steps to quickly get started with this Terraform module:

### 1. Initialization

Initialize Terraform to install necessary providers and set up the environment:

```bash
terraform init
```

### 2. Planning

Generate an execution plan to preview the changes that Terraform will make to reach your desired state:

```bash
terraform plan -target=module.[MODULE-NAME]
```

### 3. Applying

Apply the changes required to reach the desired state of the configuration:

```bash
terraform apply -target=module.[MODULE-NAME]
```

### 4. Importing Resources

To bring existing resources under Terraform management, use the import command:

```bash
terraform import module.[MODULE-NAME].[RESOURCE-ID].[RESOURCE-NAME] [PROXMOX-ID]/[PROXMOX-RESOURCE]/[NODE-ID]
```

Replace `[resource-id]` with the actual ID of the resource.

### 5. Destroying

Remove the Terraform-managed infrastructure when it's no longer needed:

```bash
terraform destroy -target=module.[MODULE-NAME]
```

## Example Configuration

Here is a simple example of what your `main.tf` might look like:

```hcl
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}

provider "proxmox" {
  pm_api_url      = var.pm_host
  pm_user         = var.pm_user
  pm_password     = var.pm_password
  pm_tls_insecure = true
}
```

Save this configuration on your main directory or define a directory like as `staging` or `production`.

Here is a simple example of what your `variable.tf` might look like:

```hcl
variable "pm_host" {
  description = "Proxmox API host"
  type        = string
}

variable "pm_user" {
  description = "Proxmox API user"
  type        = string
}

variable "pm_password" {
  description = "Proxmox API password"
  type        = string
}
```

Save this configuration on your main directory or define a directory like as `staging` or `production`.

If you want to create a modules to reuse any config on your resource, you can create directory `modules/proxmox-qemu-vm`

1. Create file `main.tf` 

```hcl
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc1"
    }
  }
}


resource "proxmox_vm_qemu" "vm_instance" {
  name                   = var.vm_name
  desc                   = var.vm_desc
  agent                  = var.vm_agent
  target_node            = var.vm_target_node
  clone                  = var.vm_template
  full_clone             = false
....
....
....
}
```

2. Create file `variable.tf`

```hcl
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
```
3. Create file on your main directory or define a directory like as `staging` or `production`.

module "proxmox_vm" {
  source      = "./modules/proxmox_vm"
  vm_name     = "terraform-vm"
  target_node = "pve1"
  clone       = "template-vm-id"
  ....
  ....
  ....
}
```

## Contributing

We welcome contributions from the community! To contribute to this project, please fork the repository, make your changes, and submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE.md). See the LICENSE file for more details.

## Project Status

This project is actively maintained. For any questions or issues, please open an issue on the project's issue tracker.

## Additional Resources

- [Terraform Documentation](https://www.terraform.io/docs)
- [Proxmox VE Documentation](https://pve.proxmox.com/pve-docs/)
- [GitLab CI/CD](https://docs.gitlab.com/ee/ci/)

---

## Contact

For support or queries, reach out via [GitHub Issues](https://github.com/hilmanzhy/issues).

Thank you for using or contributing to this project!