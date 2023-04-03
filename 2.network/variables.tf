variable "name_prefix" {
  description = "Prefix for all the resources"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidr" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
}

variable "db_subnet_cidr" {
  description = "CIDR blocks for database subnets"
  type        = list(string)
}
