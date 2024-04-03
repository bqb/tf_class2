# informed by lab '3_outputs' on 2024-04-02 bbq
output "geomeoso_rg_id" {
    value = azurerm_resource_group.geomeoso_rg.id
    description = "don't show actual data on cli output"
    sensitive = true
}

output "geomeoso_dev_rg_id" {
    value = azurerm_resource_group.geomeoso_dev_rg.id
}