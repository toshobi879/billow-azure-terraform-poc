variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "github_principal_id" {
  description = "Object ID of GitHub OIDC Service Principal"
  type        = string
}