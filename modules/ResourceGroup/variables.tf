variable "rg_name" {
  description = "name of resource group"
  type        = string
}

variable "rg_location" {
  description = "location of resource group"
  type        = string
}

variable "rg_tag" {
  description = "tag of Resource group"
  type        = map(any)
}