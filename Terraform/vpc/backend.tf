terraform {
  backend "azurerm" {
    resource_group_name  = "rg-terraform-state"
    storage_account_name = "tfstateprodstorage123"  
    container_name       = "tfstate"
    key                  = "network/${var.environment}.tfstate"
  }

}
