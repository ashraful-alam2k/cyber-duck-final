resource "tls_private_key" "tls_private" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "aws_key" {
  key_name   = "${var.name_prefix}-key"
  public_key = tls_private_key.tls_private.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.tls_private.private_key_pem
  filename = "${var.name_prefix}-key.pem"
}