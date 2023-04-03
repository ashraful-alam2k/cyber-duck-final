output "public_subnet_ids" {
  value = aws_subnet.public_subnet.*.id
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet.*.id
}

output "db_subnet_ids" {
  value = aws_subnet.db_subnet.*.id
}

output "availability_zone" {
  value = data.aws_availability_zones.available.names
}


