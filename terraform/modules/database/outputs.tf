output "db_host" {
  value = azurerm_mysql_flexible_server.mysql.fqdn
}

output "db_name" {
  value = var.db_name
}

output "db_user" {
  value     = "${var.db_admin_user}@${azurerm_mysql_flexible_server.mysql.name}"
  sensitive = true
}

output "db_password" {
  value     = var.db_admin_password
  sensitive = true
}
