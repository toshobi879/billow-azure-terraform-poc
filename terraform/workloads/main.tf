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
module "aks" {
  source = "../modules/aks"

  project_name        = var.project_name
  location            = var.location
  resource_group_name = var.resource_group_name

  aks_subnet_id = module.vnet.aks_subnet_id
}
