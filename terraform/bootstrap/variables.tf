variable "resource_group_name" {
  description = "Resource group for Terraform backend"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "storage_account_name" {
  description = "Terraform state storage account name"
  type        = string
}

variable "container_name" {
  description = "Terraform state container"
  type        = string
}

variable "github_principal_id" {
  description = "GitHub OIDC Service Principal Object ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure subscription id"
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant id"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    managed-by = "terraform"
  }
}
