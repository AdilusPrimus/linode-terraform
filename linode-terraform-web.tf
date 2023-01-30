# Comments Generated by ChatGPT AI
# This code is written in Terraform, which is a tool for provisioning infrastructure as code. The code is defining the provisioning of a virtual private server (VPS) on the Linode cloud platform.
# The first block of code specifies that the Linode provider for Terraform, version 1.27.1, is being used.
# The following block of code sets the Linode API key as a provider variable, which is used to authenticate with the Linode API.
# The next block of code creates a resource of type "linode_instance" and names it "terraform-web". This resource represents the virtual private server that will be provisioned on the Linode platform. The properties of this resource are being set using variables, such as "linode_image", "linode_image_label", "linode_image_group", "linode_image_deployment_region" and "linode_image_type".
# The following block of code defines variables that are used to set the properties of the "linode_instance" resource. "linode_api_key", "public_ssh_key" and "root_pwd" are sensitive variables, which means that their values should be protected and not exposed in plain text.
# Finally, the code creates a Linode instance with the specified properties and deploys the Linux Node on the cloud by script.

# Please execute in a Linux shell (for Windows activate WSL)
# Usage:
# 
# Debug mode can be applied to the plan command if you need to perform troubleshooting:
# TF_LOG=debug terraform plan
#  

# tfvars extensions is prefixed with .auto since it is the namin convention if we want the variables to be
# taken in consideration in Hashicorp cloud tf workspace

# Generating the plan
# terraform plan -var-file=env.auto.tfvars -out linode-linux-standard.plan
# Making the plan human readable
# terraform show -no-color linode-linux-standard.plan > plan.txt

# Provisionning VM
# terraform apply -var-file=env.auto.tfvars tf

# Deleting environment 
# Prior to running the destroy command, you can run the plan command with the -destroy option to see which servers would be removed:
# terraform plan -destroy
# If ok then
# terraform destroy -var-file=env.auto.tfvars

# Next section was coded by a human: alteration of functions by AI will be indicated
terraform {

    cloud {
      organization = "Innovarelabs"
      workspaces {
      name = "linode-terraform"
      }
    }  
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.27.1"
    }
  }
}

provider "linode" {
  token = var.linode_api_key
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