data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["cyber-duck-vpc"]
  }
}

data "aws_key_pair" "aws_key" {
  key_name = "cyber-duck-key"
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["web*"]
  }
}


data "aws_security_group" "bastion" {
  filter {
    name   = "tag:Name"
    values = ["bastion_sg"]
  }

}

data "aws_instances" "ec2_instances" {
  filter {
    name   = "tag:Name"
    values = ["cyber-duck"]
  }
}

data "aws_rds_cluster" "rds_cluster" {
  cluster_identifier = "cyberduck-cluster"
}

data "aws_secretsmanager_secret" "cyberduckDB" {
  name = "cyber-duck-secret-v123321"
}

data "aws_secretsmanager_secret_version" "cyberduckDB" {
  secret_id     = data.aws_secretsmanager_secret.cyberduckDB.id
  version_stage = "AWSCURRENT"
}

locals {
  secret = jsondecode(data.aws_secretsmanager_secret_version.cyberduckDB.secret_string)
}

