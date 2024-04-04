# calling module outputs.tf
# 

# output "rg_ids" {
    # wildcard/splatting expression
    # -- originally value = azurerm_resource_group.rgs.*.id
    # or for expression
    # value = [for rg in azurerm_resource_group.rgs : rg.id]

    # calling from module

output "resource_groups" {
    value = module.connectedrg.rg_ids
}

output "vnets" {
    value = module.connectedrg.vnet_ids 
}
