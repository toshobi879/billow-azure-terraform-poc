variable "project_name" {}
variable "location" {}
variable "resource_group_name" {}

variable "db_name" {}

variable "db_admin_user" {}
variable "db_admin_password" {}

variable "db_subnet_id" {}

# optional but recommended
variable "sku_name" {
  default = "B_Standard_B1ms"
}

variable "tags" {
  type    = map(string)
  default = {}
}
