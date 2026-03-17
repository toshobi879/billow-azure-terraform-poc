resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "${var.project_name}-mysql"
  resource_group_name    = var.resource_group_name
  location               = var.location

  administrator_login    = var.db_admin_user
  administrator_password = var.db_admin_password

  sku_name               = var.sku_name
  version                = "8.0.21"

  delegated_subnet_id    = var.db_subnet_id

  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  tags = var.tags
}

resource "azurerm_mysql_flexible_database" "db" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.mysql.name

  charset   = "utf8mb4"
  collation = "utf8mb4_unicode_ci"
}
