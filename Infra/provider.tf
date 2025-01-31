terraform {
  required_version = ">= 1.4.0, < 2.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.11.0"
    }
  }
}

provider "azurerm" {
    #subscription_id = "c2c9d8e4-cef1-4f3c-bba4-113f5fc55fc7"
 features {
   
 }
}

