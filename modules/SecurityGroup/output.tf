output "sg_id_out" {
  description = "to get the resource group tags"
  value = azurerm_network_security_group.security_group.id
}
