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
  description = "Terraform state container name"
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

variable "github_principal_id" {
  description = "Service principal object id for GitHub OIDC"
  type        = string
}

variable "tags" {
  type = map(string)
  default = {
    managed-by = "terraform"
  }
}
variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

