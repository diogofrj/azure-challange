terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }
  required_version = ">= 1.0.0"
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}


