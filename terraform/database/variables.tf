variable "project_name" {}
variable "resource_group_name" {}
variable "location" {}

variable "db_admin_username" {}
variable "db_admin_password" {
  sensitive = true
}

variable "db_name" {}
variable "sku_name" {}

variable "tags" {
  type = map(string)
}
