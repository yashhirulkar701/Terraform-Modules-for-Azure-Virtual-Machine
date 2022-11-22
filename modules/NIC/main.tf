resource "azurerm_network_interface" "network_interface" {
  /* count               = var.nic_count */
  name                = var.nic_name
  location            = var.nic_location
  resource_group_name = var.rg_name

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.nic_pri_ip_addr_alloc
    public_ip_address_id          = var.pub_ip_id
  }
}