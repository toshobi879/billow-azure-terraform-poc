output "vnet_id" {
  value = azurerm_virtual_network.vnet.id
}

output "public_subnet_ids" {
  value = { for k, v in azurerm_subnet.public : k => v.id }
}

output "private_subnet_ids" {
  value = { for k, v in azurerm_subnet.private : k => v.id }
}