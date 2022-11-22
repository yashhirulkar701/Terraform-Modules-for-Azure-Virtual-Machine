resource "azurerm_virtual_network" "virtual_network" {
  name                = var.vnet_name
  address_space       = var.vnet_addr
  location            = var.vnet_location
  resource_group_name = var.rg_name
}
