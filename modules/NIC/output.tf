output "nic_ids_out" {
  description = "ids of the vm nics provisoned."
  value       = azurerm_network_interface.network_interface.*.id
}