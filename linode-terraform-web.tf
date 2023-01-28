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
        image = "linode/ubuntu18.04"
        label = "Terraform-Web-Example"
        group = "Terraform"
        region = "us-east"
        type = "g6-standard-1"
        authorized_keys = [ "public_ssh_key" ]
        root_pass = "var.root_pwd"
}

variable "public_ssh_key" {
  description = "Linode nodes public ssh"
  type        = string
  sensitive   = true
}

variable "root_pwd" {
  description = "Node root ssh password"
  type        = string
  sensitive   = true
}

variable "linode_api_key" {
  description = "Linode PaaS API key"
  type        = string
  sensitive   = true
}
