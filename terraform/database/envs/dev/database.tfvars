resource_group_name = "Terraform_IaC_POC"
location            = "West US 2"

project_name = "billow-tf-poc"

db_admin_username = "dbadmin"
db_admin_password = "StrongPassword123!"

db_name  = "appdb"

# Cheapest option for POC
sku_name = "B_Standard_B1ms"

tags = {
  Environment = "POC"
  Project     = "billow"
}
