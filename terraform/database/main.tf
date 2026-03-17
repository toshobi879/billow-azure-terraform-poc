data "terraform_remote_state" "network" {
  backend = "azurerm"

  config = {
    resource_group_name  = "Terraform_IaC_POC"
    storage_account_name = "tfstatebillowpoc123"
    container_name       = "tfstatepoc"
    key                  = "network-dev.tfstate"
  }
}

resource "azurerm_private_dns_zone" "mysql_dns" {
  name                = "privatelink.mysql.database.azure.com"
  resource_group_name = var.resource_group_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_link" {
  name                  = "${var.project_name}-dns-link"
  private_dns_zone_name = azurerm_private_dns_zone.mysql_dns.name
  virtual_network_id    = data.terraform_remote_state.network.outputs.vnet_id
  resource_group_name   = var.resource_group_name
}

module "database" {
  source = "../modules/database"

  project_name        = var.project_name
  resource_group_name = var.resource_group_name
  location            = var.location

  db_admin_username   = var.db_admin_username
  db_admin_password   = var.db_admin_password
  db_name             = var.db_name
  sku_name            = var.sku_name

  db_subnet_id        = data.terraform_remote_state.network.outputs.db_subnet_id
  private_dns_zone_id = azurerm_private_dns_zone.mysql_dns.id

  tags = var.tags
}
