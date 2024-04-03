# test out some local variables
locals {
    prefix = "geomeoso"
    region = "westus2"
    tags = {
        cost_center = "Pauls wallet"
    }
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
    name = "${local.prefix}_rg"
    location = local.region
    tags = local.tags

}

# Create dev resource group for geomeoso
resource "azurerm_resource_group" "geomeoso_dev_rg" {
    name = "${local.prefix}_dev_rg"
    location = local.region
    tags = local.tags

}