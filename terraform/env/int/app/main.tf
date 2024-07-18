locals {
  project_extension = "dto"
  env_name          = "np"
  app_owner         = "devops"
  project_name      = ""
  env_location      = ""
  app_override_tags = {}
}

module "inf" {
  source            = "../../../modules/app"
  env_name          = local.env_name
  app_owner         = local.app_owner
  project_name      = local.project_name
  env_location      = local.env_location
  app_override_tags = local.app_override_tags
  project_extension = local.project_extension
}

terraform {
  backend "azurerm" {
    resource_group_name  = "det-dv-devops-tfm-rg"
    storage_account_name = "detdvtfmstg"
    container_name       = "detapp"
    key                  = "detapp.tfstate"
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
