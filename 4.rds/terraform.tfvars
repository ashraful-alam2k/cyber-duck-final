name_prefix = "cyberduck"

password_length           = 16
password_special_chars    = true
password_special_override = "_%@"


engine                  = "aurora-mysql"
engine_version          = "5.7.mysql_aurora.2.07.1"
backup_retention_period = 7

instance_count   = 3
db_instance_type = "db.t2.medium"

ingress_rules = [
  {
    description = "Allow inbound MySQL traffic from the app security group"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
  }
]

egress_rules = [
  {
    description = "Allow outbound MySQL traffic to the app security group"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
  }
]