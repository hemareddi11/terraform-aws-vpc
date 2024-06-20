variable "vpc_cidr" {
  description = "Provide CIDR block for the VPC"
  type        = string
}

variable "resource_prefix" {
  description = "Provide Prefix to be added to all resources"
  type        = string
}