data "aws_vpc" "myvpc" {
  filter {
    name   = "tag:Name"
    values = ["cyber-duck-vpc"]
  }
}

data "aws_subnets" "db_subnet" {
  filter {
    name   = "tag:Name"
    values = ["db*"]
  }
}

data "aws_security_group" "app_sg" {
  vpc_id = data.aws_vpc.myvpc.id
  filter {
    name   = "tag:Name"
    values = ["app*"]
  }

}

data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "zone-name"
    values = ["*a", "*b", "*c"]
  }
}

# Import the secret and secret version
data "aws_secretsmanager_secret" "cyberduckDB" {
  arn = aws_secretsmanager_secret.cyberduckDB.arn
}

data "aws_secretsmanager_secret_version" "creds" {
  secret_id     = data.aws_secretsmanager_secret.cyberduckDB.id
}
