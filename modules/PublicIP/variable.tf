/* variable "ip_count" {
  description = "count of virtual machine"
  type        = number
} */

variable "rg_name" {
  description = "name of resource group"
  type        = string
}

variable "ip_location" {
  description = "location of resource group"
  type        = string
}

variable "ip_tags" {
  description = "to the the tags of RG"
  type        = map(string)
}

variable "ip_name" {
  description = "name of public IP"
  type        = string
}

variable "pub_ip_allc_method" {
  description = "allocation method of public IP"
  type        = string
  default = "Dynamic"
}