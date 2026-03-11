data "azurerm_client_config" "current" {}

########################################
# Storage Account (Terraform State)
########################################

resource "azurerm_storage_account" "terraform_state" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  min_tls_version                 = "TLS1_2"
  allow_nested_items_to_be_public = false

  blob_properties {
    versioning_enabled = true

    delete_retention_policy {
      days = 7
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    purpose = "terraform-backend"
  }
}

########################################
# Blob Container (State Container)
########################################

resource "azurerm_storage_container" "terraform_state" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.terraform_state.name
  container_access_type = "private"
}

########################################
# RBAC for GitHub OIDC
########################################

resource "azurerm_role_assignment" "terraform_backend_access" {
  scope                = azurerm_storage_account.terraform_state.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = var.github_principal_id
}