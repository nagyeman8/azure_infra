locals {
  env_name          = ""
  inf_owner         = "devops"
  app_owner         = "devops"
  sec_owner         = "devops"
  project_name      = ""
  env_location      = ""
  project_extension = "dto"
  mon_override_tags = {}
}

module "inf" {
  source            = "../../../modules/mon"
  env_name          = local.env_name
  inf_owner         = local.inf_owner
  app_owner         = local.app_owner
  sec_owner         = local.sec_owner
  project_name      = local.project_name
  env_location      = local.env_location
  project_extension = local.project_extension
  mon_override_tags = local.mon_override_tags
}



terraform {
  backend "azurerm" {
    resource_group_name  = "det-dv-devops-tfm-rg"
    storage_account_name = "detdvtfmstg"
    container_name       = "detmon"
    key                  = "detmon.tfstate"
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