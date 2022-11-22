resource "azurerm_virtual_machine" "my_vm" {
  name                             = var.vm_name
  location                         = var.vm_location
  resource_group_name              = var.rg_name
  vm_size                          = var.vm_size
  network_interface_ids            = var.nic_id
  delete_os_disk_on_termination    = var.os_disk_deletion_on_termination
  delete_data_disks_on_termination = var.data_disks_deletion_on_termination

  storage_image_reference {
    publisher = var.vm_img_publisher
    offer     = var.vm_img_offer
    sku       = var.vm_img_sku
    version   = var.vm_img_version
  }
  storage_os_disk {
    name              = var.os_disk_name
    caching           = var.vm_storage_os_disk_caching
    create_option     = var.vm_create_option
    managed_disk_type = var.vm_managed_disk_type
    disk_size_gb      = var.size_in_gb 
  }
  os_profile {
    computer_name  = var.os_computer_name
    admin_username = var.vm_os_profile_admin_username
    admin_password = var.vm_os_profile_admin_pass
  }
  os_profile_linux_config {
    disable_password_authentication = var.vm_disable_pass_auth
  }
  tags = var.vm_tag
}