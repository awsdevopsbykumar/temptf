provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     = local.var1
  location = "westeurope"
}

variable "name" {
 default = "myrgbykumar"
}

output "resourcegroup" {
 value = azurerm_resource_group.rg
}

data "azurerm_resource_group" "example" {
  name = azurerm_resource_group.rg.name
}

output "dsout" {
 value = data.azurerm_resource_group.example
}

locals {
  var1 = "myrgfortestinglocal"
}
