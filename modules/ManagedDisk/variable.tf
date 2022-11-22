variable "md_name" {
  description = "name of Security group"
  type        = string
}

variable "rg_name" {
  description = "name of Security group"
  type        = string
}

variable "md_location" {
  description = "location of resource group"
  type        = string
}

variable "storage_acc_type" {
  description = "location of resource group"
  type        = string
}

variable "disk_size" {
  description = "location of resource group"
  type        = number
}

variable "md_tags" {
  description = "to the the tags of RG"
  type        = map(string)
}