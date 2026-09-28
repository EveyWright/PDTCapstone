terraform {
  backend "azurerm" {
    resource_group_name  = "rg-capstone-tfstate"
    storage_account_name = "capstonetfstate"
    container_name       = "tfstate"
    key                  = "capstone-devops.tfstate"
  }
}