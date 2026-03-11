terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform_IaC_POC"
    storage_account_name = "tfstatedevpoc123"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}