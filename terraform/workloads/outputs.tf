output "vnet_id" {
  value = module.vnet.vnet_id
}

output "aks_subnet_id" {
  value = module.vnet.aks_subnet_id
}

output "db_subnet_id" {
  value = module.vnet.db_subnet_id
}

output "appgw_subnet_id" {
  value = module.vnet.appgw_subnet_id
}

output "private_endpoint_subnet_id" {
  value = module.vnet.private_endpoint_subnet_id
}
