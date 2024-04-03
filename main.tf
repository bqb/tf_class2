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

# Create the very first resource
resource "azurerm_resource_group" "geomeoso_rg" {
    name = "geomeoso"
    location = "westus2"

    tags = {"cost center" = " Pauls Wallet" }
}

