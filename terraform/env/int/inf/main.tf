locals {
  project_name                              = ""
  env_name                                  = ""
  vnet_cidr                                 = [""]
  env_location                              = ""
  project_extension                         = "dto"
  inf_override_tags                         = {}
  key_vault_sku                             = "standard"
  key_vault_enabled_for_deployment          = "true"
  key_vault_enabled_for_disk_encryption     = "true"
  key_vault_enabled_for_template_deployment = "true"
}

module "inf" {
  source                                    = "../../../modules/inf"
  project_name                              = local.project_name
  env_name                                  = local.env_name
  vnet_cidr                                 = local.vnet_cidr
  env_location                              = local.env_location
  project_extension                         = local.project_extension
  inf_override_tags                         = local.inf_override_tags
  key_vault_sku                             = local.key_vault_sku
  key_vault_enabled_for_deployment          = local.key_vault_enabled_for_deployment
  key_vault_enabled_for_disk_encryption     = local.key_vault_enabled_for_disk_encryption
  key_vault_enabled_for_template_deployment = local.key_vault_enabled_for_template_deployment
}

terraform {
  backend "azurerm" {
    resource_group_name  = "det-dv-devops-tfm-rg"
    storage_account_name = "detdvtfmstg"
    container_name       = "detinf"
    key                  = "detinf.tfstate"
  }
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.99.0"
    }
  }
}

provider "azurerm" {
  features {}
}