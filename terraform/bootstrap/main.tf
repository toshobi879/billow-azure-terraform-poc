############################################
# Reference Existing Resource Group
############################################

data "azurerm_resource_group" "tf_backend" {
  name = var.resource_group_name
}

############################################
# Storage Account for Terraform State
############################################

resource "azurerm_storage_account" "tf_state" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.tf_backend.name
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

    container_delete_retention_policy {
      days = 7
    }
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    managed-by  = "terraform"
    environment = "backend"
  }
}

############################################
# Terraform State Container
############################################

resource "azurerm_storage_container" "tf_state" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.tf_state.name
  container_access_type = "private"
}
