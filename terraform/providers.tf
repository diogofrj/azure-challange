terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }
  required_version = ">= 1.0.0"
  backend "azurerm" {
    resource_group_name  = var.TF_VAR_ARM_BACKEND_RESOURCE_GROUP
    storage_account_name = var.TF_VAR_ARM_BACKEND_STORAGE_ACCOUNT
    container_name       = var.TF_VAR_ARM_BACKEND_CONTAINER
    key                  = var.TF_VAR_ARM_BACKEND_KEY
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

