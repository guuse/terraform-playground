variable "vpc_name" {
  type        = string
  description = "The name of the VPC the ES is created in"
}

variable "name" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "availability_zone_count" {
  type        = number
  description = "Number of vpc availability zones"
}

variable "elasticsearch_version" {
  type        = string
  description = "Elastic search version"
}

variable "instance_type" {
  type        = string
  description = "ES instance type"
}

variable "instance_count" {
  type        = number
  description = "Number of ES instances"
}

variable "ebs_volume_type" {
  type        = string
  description = "EBS volume type"
}

variable "ebs_volume_size" {
  type        = number
  description = "EBS volume size"
}