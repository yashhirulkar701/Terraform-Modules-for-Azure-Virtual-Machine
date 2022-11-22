variable "subnet_name" {
  description = "name of Security group"
  type        = string
}

variable "rg_name" {
  description = "name of Security group"
  type        = string
}

variable "vnet_name" {
  description = "name of Security group"
  type        = string
}

variable "subnet_addr" {
  description = "address prefix of subnet"
  type        = list(any)
}

variable "security_group_id" {
  description = "address prefix of subnet"
  type        = string
}
