output "vm_ids_out" {
  description = "ids of the vms provisoned."
  value       = azurerm_virtual_machine.my_vm.*.id
}