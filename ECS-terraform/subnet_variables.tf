variable "public_subnet_1_cidr" {
  description = "The CIDR block for the first public subnet"
  default     = "10.0.1.0/24"
}

variable "public_subnet_1_az" {
  description = "The availability zone for the first public subnet"
  default     = "us-east-1a"
}

variable "public_subnet_2_cidr" {
  description = "The CIDR block for the second public subnet"
  default     = "10.0.2.0/24"
}

variable "public_subnet_2_az" {
  description = "The availability zone for the second public subnet"
  default     = "us-east-1b"
}

variable "private_subnet_1_cidr" {
  description = "The CIDR block for the first private subnet"
  default     = "10.0.3.0/24"
}

variable "private_subnet_1_az" {
  description = "The availability zone for the first private subnet"
  default     = "us-east-1a"
}

variable "private_subnet_2_cidr" {
  description = "The CIDR block for the second private subnet"
  default     = "10.0.4.0/24"
}

variable "private_subnet_2_az" {
  description = "The availability zone for the second private subnet"
  default     = "us-east-1b"
}
