data "terraform_remote_state" "network" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Terraform_IaC_POC"
    storage_account_name = "tfstatebillowpoc123"
    container_name       = "tfstatepoc"
    key                  = "network-dev.tfstate"
  }
}

module "database" {
  source = "../modules/database"
  mysql_version       = var.mysql_version
  project_name        = var.project_name
  location            = var.location
  resource_group_name = var.resource_group_name

  db_name             = var.db_name
  db_admin_user       = var.db_admin_user
  db_admin_password   = var.db_admin_password

  db_subnet_id        = data.terraform_remote_state.network.outputs.db_subnet_id

  sku_name            = var.sku_name
  tags                = var.tags
}
