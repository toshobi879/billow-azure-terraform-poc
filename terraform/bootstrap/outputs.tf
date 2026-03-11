output "storage_account_name" {
  value = azurerm_storage_account.tf_state.name
}

output "container_name" {
  value = azurerm_storage_container.tf_state.name
}

output "storage_account_id" {
  value = azurerm_storage_account.tf_state.id
}
