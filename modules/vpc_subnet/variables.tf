variable "vpc_name" {
  type        = string
  description = "VPC Name"
}

variable "cidr_block" {
  type        = string
  description = "CIDR for the VPC and Subnet"
}

variable "subnet_name" {
  type        = string
  description = "Subnet name"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones"
}
