# resource "null_resource" "local" {
#   provisioner "local-exec" {
#     command = <<-EOT
#       cp ../3.services/cyber-duck-key.pem ./
#       eval "$(ssh-agent -s)"
#       chmod 400 cyber-duck-key.pem
#       ssh-add cyber-duck-key.pem
#     EOT
#   }
# }