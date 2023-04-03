resource "aws_security_group" "db_sg" {
  vpc_id = data.aws_vpc.myvpc.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description     = ingress.value["description"]
      from_port       = ingress.value["from_port"]
      to_port         = ingress.value["to_port"]
      protocol        = ingress.value["protocol"]
      security_groups = [data.aws_security_group.app_sg.id]
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      description     = egress.value["description"]
      from_port       = egress.value["from_port"]
      to_port         = egress.value["to_port"]
      protocol        = egress.value["protocol"]
      security_groups = [data.aws_security_group.app_sg.id]
    }
  }

  tags = {
    "Name" = "db_sg"
  }
}