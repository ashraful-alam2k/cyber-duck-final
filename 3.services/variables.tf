variable "name_prefix" {
  type = string
}

variable "image_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "device_name" {
  type = string
}

variable "volume_size" {
  type = number
}

variable "key_pair_name" {
  description = "The name of the key pair used to launch instances"
  type        = string
}

variable "db_name_prefix" {
  type = string
}

variable "web_ingress_rules" {
  description = "List of maps describing ingress rules for web security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "web_egress_rules" {
  description = "List of maps describing egress rules for web security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)

  }))
}


variable "app_ingress_rules" {
  description = "List of maps describing ingress rules for app security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

variable "app_ingress_rules_bastion" {
  description = "List of maps describing ingress rules for app security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

variable "app_egress_rules" {
  description = "List of maps describing egress rules for app security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)

  }))
}

variable "bastion_ingress_rules" {
  description = "List of maps describing ingress rules for app security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

variable "bastion_egress_rules" {
  description = "List of maps describing egress rules for app security group"
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)


  }))
}