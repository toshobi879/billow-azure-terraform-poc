output "backend_resource_group" {
  value = data.azurerm_resource_group.tf_backend.name
}

output "backend_storage_account" {
  value = azurerm_storage_account.tf_state.name
}

output "backend_container" {
  value = azurerm_storage_container.tf_state.name
}
