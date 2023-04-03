terraform {

  backend "s3" {
    encrypt        = true
    bucket         = "terra-state-cyber-duck"
    dynamodb_table = "terra-state-cyber-duck"
    key            = "cyber-duck/network/terraform.tfstate"
    region         = "us-east-1" # You can change this variable according to your profie
  }

}