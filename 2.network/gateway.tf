# Create the internet gateway resource
resource "aws_internet_gateway" "igw" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "${var.name_prefix}-igw"
  }
}

# Create the EIP resources
resource "aws_eip" "nat" {
  count = 3
  vpc   = true
  tags = {
    Name = "${var.name_prefix}-eip-${count.index + 1}"
  }
}

# Create the NAT gateway resources
resource "aws_nat_gateway" "nat" {
  count         = 3
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public_subnet[count.index].id

  tags = {
    Name = "${var.name_prefix}-nat-gateway-${count.index + 1}"
  }
}
