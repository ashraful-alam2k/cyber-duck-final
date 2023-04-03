# Create public subnets with internet access
resource "aws_subnet" "public_subnet" {
  count                   = length(var.public_subnet_cidr)
  cidr_block              = var.public_subnet_cidr[count.index]
  vpc_id                  = module.vpc.vpc_id
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "web${count.index + 1}"
  }
}

# Create private subnets without internet access
resource "aws_subnet" "private_subnet" {
  count                   = length(var.private_subnet_cidr)
  cidr_block              = var.private_subnet_cidr[count.index]
  vpc_id                  = module.vpc.vpc_id
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "app${count.index + 1}"
  }
}

# Create subnets for the database 
resource "aws_subnet" "db_subnet" {
  count                   = length(var.db_subnet_cidr)
  cidr_block              = var.db_subnet_cidr[count.index]
  vpc_id                  = module.vpc.vpc_id
  availability_zone       = element(data.aws_availability_zones.available.names, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "db${count.index + 1}"
  }
}