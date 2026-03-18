resource_group_name = "Terraform_IaC_POC"
location            = "West US 2"

project_name = "billow-tf-poc"

db_name            = "billowdb"
db_admin_user      = "mysqladmin"
db_admin_password  = "P@ssword1234!"
version            = "8.0"
sku_name = "B_Standard_B1ms"

tags = {
  Environment = "dev"
  Project     = "billow-tf-poc"
}
