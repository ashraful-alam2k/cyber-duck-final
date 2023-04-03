# Creates a private key
resource "tls_private_key" "tls_private" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS key pair and associate the previously created private key with it
resource "aws_key_pair" "aws_key" {
  key_name   = "${var.name_prefix}-key"
  public_key = tls_private_key.tls_private.public_key_openssh
}

# Write the private key to a file on the local file system
resource "local_file" "private_key" {
  content  = tls_private_key.tls_private.private_key_pem
  filename = "${var.name_prefix}-key.pem"
}