terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=4.50.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "9d85477c-d2a6-46aa-9b01-fed6058bf542"
}
