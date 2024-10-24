terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.101.0"
    }
  }
}
provider "azurerm" {
  features {} 
  
}
resource "azurerm_resource_group" "rg" {
  name     = "rg-prd-weu-clarotybkp-01"
  location = "West Europe"

  tags = {
    Enviroment ="Prod"
    SNOW       ="RITM0819554"

    

  }
}

resource "azurerm_storage_account" "staprdweuclarotybkpfs22" {
  name                     = "staprdweuclarotybkpfs22"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "Prod"
    SNOW       ="RITM0819554"
  }
}
