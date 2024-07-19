variable "project_name" {
  type = string
}

variable "env_name" {
  type = string
}

variable "vnet_cidr" {
  type = list(string)
}

variable "env_location" {
  type = string
}

variable "project_extension" {
  type = string
}

variable "inf_override_tags" {
  type    = map(string)
  default = {}
}

variable "key_vault_sku" {
  type = string
}

variable "key_vault_enabled_for_deployment" {
  type = string
}

variable "key_vault_enabled_for_disk_encryption" {
  type = string
}

variable "key_vault_enabled_for_template_deployment" {
  type = string
}