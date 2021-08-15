resource "random_uuid" "uuid" {}

resource "azurerm_resource_group" "rg" {
  name     = "rg-hello-tf"
  location = var.location
}
# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
    name                = "tf-vnet-01"
    address_space       = ["10.0.0.0/16"]
    location            = var.location
    resource_group_name = azurerm_resource_group.rg.name
    tags = {
      "environment" = "devtest"
    }
}