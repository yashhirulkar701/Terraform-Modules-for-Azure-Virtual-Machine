module "resourceGroup" {
  source      = "./modules/ResourceGroup"
  rg_name     = "my-RG"
  rg_location = "Central India"
  rg_tag      = { "key" = "value" }
}

module "publicIP" {
  source             = "./modules/PublicIP"
  ip_name            = "Dev_pip-${count.index + 1}"
  count              = 2
  rg_name            = module.resourceGroup.rg_name_out
  ip_location        = module.resourceGroup.rg_location_out
  pub_ip_allc_method = "Dynamic"
  ip_tags            = module.resourceGroup.rg_tags_out
}

module "securityGroup" {
  source      = "./modules/SecurityGroup"
  sg_name     = "Dev_sg"
  sg_location = module.resourceGroup.rg_location_out
  rg_name     = module.resourceGroup.rg_name_out
  sg_tags     = module.resourceGroup.rg_tags_out
  nsg_rules = [{
    name                       = "ssh"
    priority                   = "110"
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    },
    {
      name                       = "http"
      priority                   = "120"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "80"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "https"
      priority                   = "130"
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "443"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
  }]
}

module "vNet" {
  source        = "./modules/VNet"
  vnet_name     = "Dev-vnet"
  vnet_addr     = ["10.0.0.0/16"]
  vnet_location = module.resourceGroup.rg_location_out
  rg_name       = module.resourceGroup.rg_name_out
}

module "subnet" {
  depends_on        = [module.vNet]
  source            = "./modules/Subnet"
  subnet_name       = "Dev-subnet"
  rg_name           = module.resourceGroup.rg_name_out
  vnet_name         = module.vNet.vnet_name_out
  subnet_addr       = ["10.0.2.0/24"]
  security_group_id = module.securityGroup.sg_id_out
}

module "networkInterfaceCard" {
  depends_on            = [module.subnet]
  source                = "./modules/NIC"
  count                 = 2
  nic_name              = "Dev-nic-${count.index + 1}"
  nic_location          = module.resourceGroup.rg_location_out
  rg_name               = module.resourceGroup.rg_name_out
  nic_ip_config_name    = "nic-ip-config-${count.index + 1}"
  subnet_id             = module.subnet.subnet_id_out
  nic_pri_ip_addr_alloc = "Dynamic"
  pub_ip_id             = element(module.publicIP.*.ip_id_out[count.index], count.index)
}

module "virtualMachine" {
  depends_on                         = [module.networkInterfaceCard]
  source                             = "./modules/VM"
  count                              = 2
  vm_name                            = "vm-${count.index + 1}"
  vm_size                            = "Standard_B1s"
  rg_name                            = module.resourceGroup.rg_name_out
  vm_location                        = module.resourceGroup.rg_location_out
  nic_id                             = ["${element(module.networkInterfaceCard.*.nic_ids_out[count.index], count.index)}"]
  os_disk_deletion_on_termination    = true
  data_disks_deletion_on_termination = true
  vm_img_publisher                   = "Canonical"
  vm_img_offer                       = "UbuntuServer"
  vm_img_sku                         = "16.04-LTS"
  vm_img_version                     = "latest"
  os_disk_name                       = "vm-${count.index + 1}-OS-Disk"
  size_in_gb                         = 30
  os_computer_name                   = "host${count.index + 1}"
  vm_storage_os_disk_caching         = "ReadWrite"
  vm_create_option                   = "FromImage"
  vm_managed_disk_type               = "Standard_LRS"
  vm_os_profile_admin_username       = "don"
  vm_os_profile_admin_pass           = "Don@08071999"
  vm_disable_pass_auth               = false
  vm_tag                             = module.resourceGroup.rg_tags_out
}

module "managedDisk" {
  depends_on       = [module.virtualMachine]
  source           = "./modules/ManagedDisk"
  count            = 2
  md_name          = "managed-disk-${count.index + 1}"
  rg_name          = module.resourceGroup.rg_name_out
  md_location      = module.resourceGroup.rg_location_out
  storage_acc_type = "Standard_LRS"
  disk_size        = 30
  md_tags          = module.resourceGroup.rg_tags_out
}

module "disk_VM_attachment" {
  depends_on = [module.managedDisk]
  source     = "./modules/MD_VM_Attachment"
  count      = 2
  md_id      = "${element(module.managedDisk.*.md_ids_out[count.index], count.index)}"
  vm_id      = "${element(module.virtualMachine.*.vm_ids_out[count.index], count.index)}"
  cache      = "ReadWrite"
}


