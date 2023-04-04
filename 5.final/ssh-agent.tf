resource "null_resource" "local" {
  provisioner "local-exec" {
    command = <<-EOT
      cp ../3.services/cyber-duck-key.pem ./
    EOT
  }
}