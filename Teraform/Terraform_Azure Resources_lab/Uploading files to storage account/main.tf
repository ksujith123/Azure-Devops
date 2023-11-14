/*
cloudatwork.io
*/

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.8.0"
    }
  }
}

provider "azurerm" {
subscription_id   = "9106772c-0e98-4a3a-a2d2-952c510016c9"
tenant_id         = "4954dd78-1aa7-45fd-97e9-8048247d270b"
client_id         = "3b621f26-3403-47fa-8e69-cb2aff89b7fb"
client_secret     = "fs88Q~geTSYrR88s7Rtmtp3XWt1DuUQKp.CQcbtd"
  features {}  
}

resource "azurerm_resource_group" "appgrp" {
  name     = "app-grp"
  location = "North Europe"
}

resource "azurerm_storage_account" "tmcsa" {
  name                     = "tmcsa"
  resource_group_name      = "app-grp"
  location                 = "North Europe"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = azurerm_storage_account.tmcsa.name
  container_access_type = "blob"
}

resource "azurerm_storage_blob" "uploaddata" {
  for_each = fileset(path.module, "data_uploads/*")
 
  name                   = trim(each.key, "data_uploads/")
  storage_account_name   = azurerm_storage_account.tmcsa.name
  storage_container_name = azurerm_storage_container.data.name
  type                   = "Block"
  source                 = each.key
}