resource_group_name = "Terraform_IaC_POC"
location            = "West US 2"

project_name = "billow-tf-poc"

vnet_cidr = "10.10.0.0/16"

aks_subnet_cidr              = "10.10.2.0/24"
db_subnet_cidr               = "10.10.3.0/24"
appgw_subnet_cidr            = "10.10.1.0/24"
private_endpoint_subnet_cidr = "10.10.4.0/24"
