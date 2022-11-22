output "rg_name_out" {
  description = "to get the resource group name"
  value = azurerm_resource_group.resource_group.name
}

output "rg_location_out" {
  description = "to get the resource group location"
  value = azurerm_resource_group.resource_group.location
}

output "rg_tags_out" {
  description = "to get the resource group tags"
  value = azurerm_resource_group.resource_group.tags
}
