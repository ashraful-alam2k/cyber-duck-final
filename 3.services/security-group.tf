resource "aws_security_group" "web" {
  vpc_id = data.aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = var.web_ingress_rules
    content {
      description = ingress.value["description"]
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  dynamic "egress" {
    for_each = var.web_egress_rules
    content {
      description = egress.value["description"]
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }

  tags = {
    "Name" = "web_sg"
  }
}

resource "aws_security_group" "app" {
  vpc_id = data.aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = var.app_ingress_rules
    content {
      description     = ingress.value["description"]
      from_port       = ingress.value["from_port"]
      to_port         = ingress.value["to_port"]
      protocol        = ingress.value["protocol"]
      security_groups = [aws_security_group.web.id]
    }
  }

  dynamic "ingress" {
    for_each = var.app_ingress_rules_bastion
    content {
      description     = ingress.value["description"]
      from_port       = ingress.value["from_port"]
      to_port         = ingress.value["to_port"]
      protocol        = ingress.value["protocol"]
      security_groups = [aws_security_group.bastion.id]
    }
  }


  dynamic "egress" {
    for_each = var.app_egress_rules
    content {
      description = egress.value["description"]
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]

    }
  }

  tags = {
    "Name" = "app_sg"
  }


}

resource "aws_security_group" "bastion" {
  vpc_id = data.aws_vpc.my_vpc.id

  dynamic "ingress" {
    for_each = var.bastion_ingress_rules
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = [format("%s/32", chomp(data.http.myip.response_body))]
    }
  }

  dynamic "egress" {
    for_each = var.bastion_egress_rules
    content {
      from_port   = egress.value["from_port"]
      to_port     = egress.value["to_port"]
      protocol    = egress.value["protocol"]
      cidr_blocks = egress.value["cidr_blocks"]
    }
  }

  tags = {
    "Name" = "bastion_sg"
  }
}
