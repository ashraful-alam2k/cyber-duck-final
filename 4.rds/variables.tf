variable "name_prefix" {
  description = "Prefix for all the resources"
}

variable "password_length" {
  type = number
}

variable "password_special_chars" {
  type = bool
}

variable "password_special_override" {
  type = string
}

variable "engine" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "backup_retention_period" {
  type = number
}

variable "instance_count" {
  type = number
}

variable "db_instance_type" {
  type = string
}

variable "ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}

variable "egress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
  }))
}
