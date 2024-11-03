terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
  subscription_id = "134f0db0-07de-452d-a3ef-84795666606d"
}

