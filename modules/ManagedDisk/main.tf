resource "azurerm_managed_disk" "managed_disk" {
  name                 = var.md_name
  location             = var.md_location
  resource_group_name  = var.rg_name
  storage_account_type = var.storage_acc_type
  create_option        = "Empty"
  disk_size_gb         = var.disk_size
  tags = var.md_tags
}

