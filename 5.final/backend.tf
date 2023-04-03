terraform {

  backend "s3" {
    encrypt        = true
    bucket         = "terra-state-cyber-duckv1"
    dynamodb_table = "terra-state-cyber-duckv1"
    key            = "cyber-duck/final/terraform.tfstate"
    region         = "eu-west-2" # You can change this variable according to your profie
  }

}