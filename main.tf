terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }    
  }
}

data "azurerm_client_config" "current" {}

# Create a resource group
resource "azurerm_resource_group" "rg-vms" {
  provider = azurerm.test1
  name     = "rg-${var.environment}-${var.locationvar}-${var.resourcevm}"
  location = var.location
}

# Create Storage Account for blobs

resource "azurerm_storage_account" "storageaccount" {
  name                     = "sa${lower(var.environment)}auebart"
  resource_group_name      = azurerm_resource_group.rg-vms.name
  location                 = var.location
  account_tier             = var.storagetier
  account_replication_type = var.replicationtype
  account_kind             = var.storagekind

}