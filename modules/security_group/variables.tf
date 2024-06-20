variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "resource_prefix" {
  description = "Provide Prefix to be added to all resources"
  type        = string
}

variable "security_group_name" {
  description = "Provide The name of the security group"
  type        = string
}

variable "security_group_rules" {
  description = "List of security group rules"
  type = any
}