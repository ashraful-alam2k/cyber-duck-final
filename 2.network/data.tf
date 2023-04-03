data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name   = "zone-name"
    values = ["*a", "*b", "*c"]
  }
}