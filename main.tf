
# Specifiy the provider and version
terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~>3.34.0"
        }
    }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
}

# Create list-driven resource groups for geomeoso
resource "azurerm_resource_group" "rgs" {
    count = length(var.rg_names)
    name = "${var.prefix}_${var.rg_names[count.index]}"
    location = var.region
    tags = var.tags
}

# this is pretty heavy to sift through before class, 
# but oh so cool a pattern it is!  2024-04-02 bbq
# 
resource "azurerm_virtual_network" "vnets" {
    count               = length(var.rg_names)
    name                = lookup(var.vnets[count.index], "name")
    address_space       = [lookup(var.vnets[count.index], "address")] 
    location            = var.region
    resource_group_name = azurerm_resource_group.rgs[count.index].name

}