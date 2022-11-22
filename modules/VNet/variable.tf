variable "vnet_name" {
  description = "name of Security group"
  type        = string
}

variable "rg_name" {
  description = "name of Security group"
  type        = string
}

variable "vnet_location" {
  description = "name of Security group"
  type        = string
}

variable "vnet_addr" {
  description = "address space of virtual network"
  type        = list(any)
}

