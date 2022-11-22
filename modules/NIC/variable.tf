/* variable "nic_count" {
  description = "count of network interface cards"
  type        = number
} */

variable "nic_name" {
  description = "name of Security group"
  type        = string
}

variable "nic_ip_config_name" {
  description = "count of network interface cards"
  type        = string
}

variable "pub_ip_id" {
  description = "count of network interface cards"
  type        = string
}

variable "rg_name" {
  description = "name of Security group"
  type        = string
}

variable "nic_location" {
  description = "location of resource group"
  type        = string
}

variable "subnet_id" {
  description = "address prefix of subnet"
  type        = string
}

variable "nic_pri_ip_addr_alloc" {
  description = "private ip address allocation configuration of network interface"
  type        = string
  default = "Dynamic"
}