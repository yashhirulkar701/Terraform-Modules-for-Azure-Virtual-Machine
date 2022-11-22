output "md_ids_out" {
  description = "ids of the vm nics provisoned"
  value       = azurerm_managed_disk.managed_disk.*.id
}