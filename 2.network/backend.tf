# defines the backend configuration for storing the Terraform state filel
terraform {

  backend "s3" {
    encrypt        = true
    bucket         = "terra-state-cyber-duck"
    dynamodb_table = "terra-state-cyber-duck"
    key            = "cyber-duck/network/terraform.tfstate"
  }

}