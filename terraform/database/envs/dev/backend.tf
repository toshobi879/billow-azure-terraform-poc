terraform {
  backend "azurerm" {
    resource_group_name  = "Terraform_IaC_POC"
    storage_account_name = "tfstatebillowpoc123"
    container_name       = "tfstatepoc"
    key                  = "database-dev.tfstate"
  }
}
