variable prefix {}

variable region {
    type = string
    default = "westus2"
}

variable tags {
    type = map
}


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

# Create main resource group for geomeoso
resource "azurerm_resource_group" "geomeoso_rg" {
    name = "${var.prefix}_rg"
    location = var.region
    tags = var.tags

}

# Create dev resource group for geomeoso
resource "azurerm_resource_group" "geomeoso_dev_rg" {
    name = "${var.prefix}_dev_rg"
    location = var.region
    tags = var.tags

}