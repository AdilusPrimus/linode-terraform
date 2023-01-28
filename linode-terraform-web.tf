terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  token = "linode_api_key"
}

resource "linode_instance" "terraform-web" {
        image           = var.linode_image
        label           = var.linode_image_label
        group           = var.Linode_image_group
        region          = var.linode_image_deployment_region
        type            = var.linode_image_type
        authorized_keys = [ var.public_ssh_key ]
        root_pass       = var.root_pwd
}

# System environment exported variable
variable "linode_api_key" {
  description = "Linode PaaS API key"
  type        = string
  sensitive   = true
}

# System environment exported variable
variable "public_ssh_key" {
  description = "Linode nodes public ssh"
  type        = string
  sensitive   = true
}

# System environment exported variable
variable "root_pwd" {
  description = "Node root ssh password"
  type        = string
  sensitive   = true
}
