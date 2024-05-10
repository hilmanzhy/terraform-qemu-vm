# Terraform Proxmox QEMU VM Module

This project provides Terraform configurations for provisioning virtual machines using the Proxmox QEMU provider. It is designed to help you quickly deploy and manage VMs in a Proxmox environment using Terraform.

## Prerequisites

Before you begin, ensure you have the following prerequisites installed and configured:

- Proxmox VE installed and accessible.
- Terraform v0.13+ installed on your machine.
- Proper credentials (API token or username and password) with sufficient permissions configured in Proxmox.

## Quick Start

Follow these steps to quickly get started with this Terraform module:

#co## 1. Initialization

Initialize Terraform to install necessary providers and set up the environment:

```bash
terraform init

2. Planning
Generate an execution plan to preview the changes that Terraform will make to reach your desired state:

```bash
terraform plan

3. Applying
Apply the changes required to reach the desired state of the configuration:

```bash
terraform apply

4. Importing Resources
To bring existing resources under Terraform management, use the import command:

```bash
terraform import module.proxmox_vm.proxmox_vm_qemu.vm_instance [resource-id]
Replace [resource-id] with the actual ID of the resource.

5. Destroying
Remove the Terraform-managed infrastructure when it's no longer needed:

```bash
terraform destroy

Example Configuration
Here is a simple example of what your main.tf might look like:

hcl
provider "proxmox" {
  pm_api_url      = "https://your-proxmox-server:8006/api2/json"
  pm_user         = "root@pam"
  pm_password     = "your-password"
  pm_tls_insecure = true
}

module "proxmox_vm" {
  source      = "./modules/proxmox_vm"
  vm_name     = "terraform-vm"
  target_node = "pve1"
  clone       = "template-vm-id"
}
Contributing
We welcome contributions from the community! To contribute to this project, please fork the repository, make your changes, and submit a pull request.

License
This project is licensed under the MIT License. See the LICENSE file for more details.

Project Status
This project is actively maintained. For any questions or issues, please open an issue on the project's issue tracker.

Additional Resources
Terraform Documentation
Proxmox VE Documentation
GitLab CI/CD
Contact
For support or queries, reach out via GitHub Issues.

Thank you for using or contributing to this project!

