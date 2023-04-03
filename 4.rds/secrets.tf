resource "random_password" "password" {
  length           = var.password_length
  special          = var.password_special_chars
  override_special = var.password_special_override
}

# Creating a AWS secret for database master account 

resource "aws_secretsmanager_secret" "cyberduckDB" {
  name = "cyber-duck-secret-v123321"
}

# Creating a AWS secret versions for database master account 
resource "aws_secretsmanager_secret_version" "sversion" {
  secret_id = aws_secretsmanager_secret.cyberduckDB.id
  secret_string = jsonencode({
    username = "adminaccount",
    password = random_password.password.result
  })

  lifecycle {
    create_before_destroy = true
  }
}

# Store the secret values in locals
locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.creds.secret_string)
}