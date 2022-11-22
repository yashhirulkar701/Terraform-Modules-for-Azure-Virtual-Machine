resource "azurerm_public_ip" "public_ip" {
  /* count               = var.ip_count */
  name                = var.ip_name
  resource_group_name = var.rg_name
  location            = var.ip_location
  allocation_method   = var.pub_ip_allc_method
  tags                = var.ip_tags

}