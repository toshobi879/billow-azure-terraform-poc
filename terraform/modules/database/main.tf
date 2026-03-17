resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "${var.project_name}-mysql"
  location               = var.location
  resource_group_name    = var.resource_group_name

  administrator_login    = var.db_admin_user
  administrator_password = var.db_admin_password

  sku_name               = var.sku_name
  version                = "8.0.21"

  delegated_subnet_id    = var.db_subnet_id

  # storage_mb = 20480

  backup_retention_days  = 7

  public_network_access_enabled = false

  tags = var.tags
}
