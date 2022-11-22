resource "azurerm_virtual_machine_data_disk_attachment" "md_attachment" {
  managed_disk_id    = var.md_id
  virtual_machine_id = var.vm_id
  lun                = "10"
  caching            = var.cache
}