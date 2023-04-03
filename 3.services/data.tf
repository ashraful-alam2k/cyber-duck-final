# The data sources will be used later  to create AWS resources or configure them 
data "aws_vpc" "my_vpc" {
  filter {
    name   = "tag:Name"
    values = ["cyber-duck-vpc"]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["app*"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["web*"]
  }
}

# Retrieves public address of the machine
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"

}

