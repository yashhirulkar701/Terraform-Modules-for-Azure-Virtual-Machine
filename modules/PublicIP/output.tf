output "ip_id_out" {
  description = "to get the resource group name"
  value = azurerm_public_ip.public_ip.*.id
}


