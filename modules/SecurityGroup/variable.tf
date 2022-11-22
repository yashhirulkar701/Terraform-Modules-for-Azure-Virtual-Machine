variable "sg_name" {
  description = "name of Security group"
  type        = string
}

variable "rg_name" {
  description = "name of Security group"
  type        = string
}

variable "sg_location" {
  description = "location of Security group"
  type        = string
}

variable "sg_tags" {
  description = "to the the tags of IP"
  type        = map(string)
}

variable "nsg_rules" {
  description = "values for each nsg rule"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}