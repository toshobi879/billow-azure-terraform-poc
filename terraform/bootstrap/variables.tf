variable "resource_group_name" {
  description = "Existing resource group for Terraform backend"
  type        = string
}

variable "storage_account_name" {
  description = "Terraform state storage account name"
  type        = string
}

variable "container_name" {
  description = "Terraform state container name"
  type        = string
}
