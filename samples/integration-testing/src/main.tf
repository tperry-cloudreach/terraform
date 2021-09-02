terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.72.0"
    }
  }
    backend "azurerm" {
        resource_group_name  = "tfstate"
        storage_account_name = "tfstate4875"
        container_name       = "tfstate"
        key                  = "terraform.tfstate"
    }

}
resource "azurerm_resource_group" "rg" {
  name     = local.apps_resource_group_name
  location = local.region
  tags =  local.tags
}
# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "tf-vnet-01"
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = merge(
    {
      env = local.environment
    },
    local.tags
  )
}
