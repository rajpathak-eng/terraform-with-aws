variable "security_group_name" {
  description = "The name of the security group"
  default     = "allow_all"
}

variable "security_group_description" {
  description = "The description of the security group"
  default     = "Allow all inbound traffic"
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks to allow in ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "egress_cidr_blocks" {
  description = "List of CIDR blocks to allow in egress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}
