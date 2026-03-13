variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vnet_cidr" {
  type = string
}

variable "aks_subnet_cidr" {
  type = string
}

variable "db_subnet_cidr" {
  type = string
}

variable "appgw_subnet_cidr" {
  type = string
}

variable "private_endpoint_subnet_cidr" {
  type = string
}
