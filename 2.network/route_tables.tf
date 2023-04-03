# Create the route table for web tier
resource "aws_route_table" "web" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "web"
  }
}

# Create 3 route tables for application tier
resource "aws_route_table" "app" {
  count  = 3
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "app${count.index + 1}"
  }
}

# Create the route table for db
resource "aws_route_table" "db" {
  vpc_id = module.vpc.vpc_id

  tags = {
    Name = "db"
  }
}

# Below are used to associate specific route tables to specific group of subnets

resource "aws_route_table_association" "public_web_association" {
  count = length(var.public_subnet_cidr)

  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.web.id
}

resource "aws_route_table_association" "private_app_association_1" {
  count = length(var.private_subnet_cidr)

  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.app[count.index].id
}

resource "aws_route_table_association" "db_association" {
  count = length(var.db_subnet_cidr)

  subnet_id      = aws_subnet.db_subnet[count.index].id
  route_table_id = aws_route_table.db.id
}


# Create a route in the route table to allow outbound traffic to the internet gateway

resource "aws_route" "web_route" {
  route_table_id         = aws_route_table.web.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Create 3 routes in the route table to allow outbound traffic to the internet, using a NAT gateway for each private subnet.

resource "aws_route" "app_route" {
  count                  = 3
  route_table_id         = aws_route_table.app[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}