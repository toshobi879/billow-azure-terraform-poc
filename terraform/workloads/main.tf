module "vnet" {
  source = "../modules/vnet"

  resource_group_name = var.resource_group_name
  location            = var.location
  project_name        = var.project_name

  vnet_cidr                     = var.vnet_cidr
  aks_subnet_cidr               = var.aks_subnet_cidr
  db_subnet_cidr                = var.db_subnet_cidr
  appgw_subnet_cidr             = var.appgw_subnet_cidr
  private_endpoint_subnet_cidr  = var.private_endpoint_subnet_cidr
}



####
data "terraform_remote_state" "vnet" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Terraform_IaC_POC"
    storage_account_name = "tfstatebillowpoc123"
    container_name       = "tfstatepoc"
    key                  = "network-dev.tfstate"
  }
}

module "aks" {
  source = "../modules/aks"

  project_name        = var.project_name
  location            = var.location
  resource_group_name = var.resource_group_name

  aks_subnet_id = data.terraform_remote_state.vnet.outputs.aks_subnet_id
}
