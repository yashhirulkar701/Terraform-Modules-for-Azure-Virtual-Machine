variable "vm_name" {
  description = "name of VM"
  type        = string
}

variable "vm_size" {
  description = "size of virtual machine"
  type        = string
}

variable "rg_name" {
  description = "name of Security group"
  type        = string
}

variable "vm_location" {
  description = "name of Security group"
  type        = string
}

variable "nic_id" {
  description = "name of Security group"
  type        = list(string)
}

variable "os_disk_deletion_on_termination" {
  description = "should the os disk be deleted when vm is terminated?"
  type        = bool
}

variable "data_disks_deletion_on_termination" {
  description = "should the data be deleted when vm is terminated?"
  type        = bool
  default = true
}

variable "vm_img_publisher" {
  description = "publisher of the image used to create the virtual machine"
  type        = string
  default = "Canonical"
}

variable "vm_img_offer" {
  description = "offer of the image used to create the virtual machine"
  type        = string
  default = "UbuntuServer"
}

variable "vm_img_sku" {
  description = "sku of the image used to create the virtual machine"
  type        = string
  default = "16.04-LTS"
}

variable "vm_img_version" {
  description = "version of the image used to create the virtual machine"
  type        = string
  default = "latest"
}

variable "os_disk_name" {
  description = "version of the image used to create the virtual machine"
  type        = string
}

variable "os_computer_name" {
  description = "version of the image used to create the virtual machine"
  type        = string
}

variable "vm_storage_os_disk_caching" {
  description = "caching requirements for the os disk"
  type        = string
}

variable "vm_create_option" {
  description = "specifies how the os disk should be created"
  type        = string
}

variable "vm_managed_disk_type" {
  description = "specifies the type of managed disk to create"
  type        = string
}

variable "size_in_gb" {
  description = "specifies the type of managed disk to create"
  type        =  number
}

variable "vm_os_profile_admin_username" {
  description = "specifies the name of the local administrator account."
  type        = string
  sensitive   = true
}

variable "vm_os_profile_admin_pass" {
  description = "specifies the password associated with the local administrator account"
  type        = string
  sensitive   = true
}

variable "vm_disable_pass_auth" {
  description = "specifies whether password authentication should be disabled"
  type        = string
}

variable "vm_tag" {
  description = "tag of Resource group"
  type        = map(any)
}