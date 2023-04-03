resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.name_prefix}-db-subnet-group"
  subnet_ids = data.aws_subnets.db_subnet.ids
}

resource "aws_rds_cluster" "rds_cluster" {
  cluster_identifier      = "${var.name_prefix}-cluster"
  engine                  = var.engine
  engine_version          = var.engine_version
  database_name           = "${var.name_prefix}db"
  apply_immediately       = true
  master_username         = local.db_creds.username
  master_password         = local.db_creds.password
  storage_encrypted       = true
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = "03:00-04:00"
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot     = true

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  availability_zones = data.aws_availability_zones.available.names

  lifecycle {
    ignore_changes = [
      engine_version,
      master_password
    ]
  }
}

resource "aws_rds_cluster_instance" "rds_instances" {
  count                = var.instance_count
  identifier           = "${var.name_prefix}-instance-${count.index}"
  cluster_identifier   = aws_rds_cluster.rds_cluster.id
  instance_class       = var.db_instance_type
  engine               = var.engine
  engine_version       = var.engine_version
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
}