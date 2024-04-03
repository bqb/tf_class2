
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

# 
resource "azurerm_virtual_network" "vnets" {
    count               = length(var.rg_names)
    name                = lookup(var.vnets[count.index], "name")
    address_space       = [lookup(var.vnets[count.index], "address")] 
    location            = var.region
    resource_group_name = azurerm_resource_group.rgs[count.index].name
#   depends_on          = [ azurerm_resource_group.rgs ]
}

#  Root Module  vs  Sub Module in class 5_ and 6_
/*   modules  - lightweight apps, better organization, encapsulation, reusability, local or remote, distributatble, can be nested, composable 
  composable building blocks

module "connectedrg" {
    source = "./modules/geomeoso-az-connectedrg"
    rg_names = var.rg_names
    vnets = var.vnets
}

1) resource modules  [ VNET storage, app service plan, sql db, app services, front doors]
2) stack modules   [1-tier web app with sql db,  2-tier web app with db, storage, and private net]
3) root module  [calling stacks, not resources directly]

##  Modules - What and Why of Innter Source (internal open source)
-- Platform team provides
a) guidance
b) validation
c) approval

-- optimized for fast flow and sharing
- do not hold up teams needing new module
- easy discovery to promote use and re-use of modules
- no need for huge central backlog
- no need for cumbersome pre-approval / planning process

## Root Module Sizing
-- number of resources managed
- refresh time grows linearly
- blast radius (so any failure is more contained, within bulkheads)
- maintainability
- size of state file

-- memory usage
- graph generation
- agent sizing

-- plan time  [ az RH OpenShift cluster takes 45 min!]

-- plan ahead or refactor later
- split vertical or horizontal

-- share outputs or use data sources (within other processes or to be called)
*/
