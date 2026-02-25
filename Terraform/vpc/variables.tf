variable "environment" {
  description = "Environment name (dev or prod)"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_cidr" {
  description = "CIDR for VNet"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = map(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = map(string)
}

variable "tags" {
  description = "Common tags"
  type        = map(string)
  default     = {}
}