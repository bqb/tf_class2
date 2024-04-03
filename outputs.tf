# outputs.tf
# informed by lab '3_outputs' on 2024-04-02 bbq
output "rg_ids" {
    # wildcard/splatting expression
    value = azurerm_resource_group.rgs.*.id
    # or for expression
    # value = [for rg in azurerm_resource_group.rgs : rg.id]
}
