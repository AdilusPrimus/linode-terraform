
# System environment exported variable
variable "linode_api_key" {
  description = "Linode PaaS API key"
  type        = string
  sensitive   = true
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
# end of system environment exported variable

# Variables defined in env.tfvaresource
# sensitive = false by default
variable "linode_image" {
  description = "Image template used to build the VM (OS)"
  type        = string
}

variable "linode_image_label" {
  description = "Name of the provisioned node"
  type        = string
}

variable "Linode_image_group" {
  description = "Logical grouping of provisionned environments"
  type        = string
}

variable "linode_image_deployment_region" {
  description = "Targetted data center region for deployment"
  type        = string
}

variable "linode_image_type" {
  description = "Type of image: resources"
  type        = string
  sensitive   = true
}
# End of defined variables in env.tfvaresource