variable "resource_group_name" {
  description = "Terraform backend resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_name" {
  description = "Terraform backend storage account"
  type        = string
}

variable "container_name" {
  description = "Terraform state container"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)

  default = {
    managed-by  = "terraform"
    environment = "backend"
  }
}
